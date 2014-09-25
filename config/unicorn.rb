worker_processes 4

working_directory "/home/ubuntu/artistnxt" # available in 0.94.0+

listen "/home/ubuntu/artistnxt/tmp/sockets/unicorn.socket", :backlog => 64
listen "127.0.0.1:8080", :tcp_nopush => true

timeout 360

pid "/home/ubuntu/artistnxt/tmp/pids/unicorn.pid"

stderr_path "/home/ubuntu/artistnxt/log/unicorn.stderr.log"
stdout_path "/home/ubuntu/artistnxt/log/unicorn.stdout.log"

preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

check_client_connection false

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end

end

after_fork do |server, worker|

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection


end
