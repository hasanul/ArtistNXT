#!/usr/bin/env ruby

require 'bundler/setup'
require 'benchmark'

groups = ENV["BUNDLE_GROUPS"].to_s.split(",")

# taken from https://github.com/carlhuda/bundler/blob/v1.2.4/lib/bundler/runtime.rb

REGEXPS = [
  /^no such file to load -- (.+)$/i,
  /^Missing \w+ (?:file\s*)?([^\s]+.rb)$/i,
  /^Missing API definition file in (.+)$/i,
  /^cannot load such file -- (.+)$/i
]

groups.map! { |g| g.to_sym }
groups = [:default] if groups.empty?

def pull(dep)
  required_file = nil

  begin
    # Loop through all the specified autorequires for the
    # dependency. If there are none, use the dependency's name
    # as the autorequire.
    Array(dep.autorequire || dep.name).each do |file|
      required_file = file
      Kernel.require file
    end
  rescue LoadError => e
    if dep.autorequire.nil? && dep.name.include?('-')
      begin
        namespaced_file = dep.name.gsub('-', '/')
        Kernel.require namespaced_file
      rescue LoadError
        REGEXPS.find { |r| r =~ e.message }
        regex_name = $1
        raise if dep.autorequire || (regex_name && regex_name.gsub('-', '/') != namespaced_file)
        raise e if regex_name.nil?
      end
    else
      REGEXPS.find { |r| r =~ e.message }
      raise if dep.autorequire || $1 != required_file
    end
  end
end

# get list of gems

dependencies = Bundler.setup.dependencies

# include rails first if it exists

rails_included = dependencies.map(&:name).include?("rails")
if rails_included
  rails_time =
    Benchmark.realtime do
      require 'rails/all'

      # If you would prefer gems to incur the cost of autoloading
      # Rails frameworks, then comment out this next line.
      ActiveSupport::Autoload.eager_autoload!
    end
end

# time loads

gems = {}

$VERBOSE = nil
dependencies.each do |dep|
  if ((dep.groups & groups).any? && dep.current_platform?)
    gems[dep.name] = Benchmark.realtime{ pull(dep) }
    putc "."
  end
end
puts "[DONE]\n\n"

# set real rails gem load time

if rails_included
  gems["rails"] = rails_time
end

# calculate total for percentages

total = gems.map{|gem, time| time }.inject(0.0){|x, sum| sum + x }

# output results

format = "%-30s %9.4f %8.1f%%"
line = "-"*50

puts "%s %36s %9s" % ["Gem", "Time(sec)", "Pct %"]
puts line
gems.sort_by{|gem, time| time }.reverse.each do |gem, time|
  puts format % [gem, time, (time / total * 100)]
end
puts line
puts format % ["Total", total, 100]
