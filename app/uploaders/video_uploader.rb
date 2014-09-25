# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick
  include CarrierWave::Video
  include CarrierWave::Video::Thumbnailer
  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end  

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(flv mp4 avi mov mpg vdo)
  end

  process encode_video: [:mp4]

  def filename
    random_token = Digest::SHA2.hexdigest("#{Time.now.utc}--#{model.id.to_s}").first(20)   
    ivar = "@#{mounted_as}_secure_token"    
    token = model.instance_variable_get(ivar)
    token ||= model.instance_variable_set(ivar, random_token)
    "#{token}.mp4" if original_filename
  end


  version :webm do
    process :encode_video => [:webm]
    def full_filename(for_file)
      "#{File.basename(for_file, File.extname(for_file))}.webm"
    end
  end  
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  version :large do 
    process thumbnail: [{format: 'png', quality: 10, size: 640, logger: Rails.logger}]
    def full_filename for_file
       png_name for_file, version_name
    end
  end

  version :thumb do 
    process thumbnail: [{format: 'png', quality: 10, size: 215, logger: Rails.logger}]
    def full_filename for_file
       png_name for_file, version_name
    end
  end

  version :small do 
    process thumbnail: [{format: 'png', quality: 10, size: 138, logger: Rails.logger}]
    def full_filename for_file
       png_name for_file, version_name
    end
  end  

  def png_name for_file, version_name    
    %Q{#{for_file.chomp(File.extname(for_file))}_#{version_name}.png}
  end

end
