class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery except: :upload_photo
  
  layout :layout_by_resource
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end
  
  def after_sign_in_path_for(resource)
        
    loggedInUser = User.find(resource.id)
    loggedInUser.update(:lastlogintime=>Time.now.to_i)#save the current login time
    if resource.role == "administrator"
      admin_dashboard_path
    else
      profile_index_path
    end    
  end
  
  def upload_photo
    
    uploaded_io = params[:photo_upload]
    
    # GET THE EXTENSION, DIRECTORY, AND VIRTUAL PATH
    extension = File.extname(uploaded_io.original_filename)
    dir = Rails.root.join('public', 'uploads', 'tmp')

    # CREATE THE DIRECTORY IF IT DOESNT EXIST
    Dir.mkdir(dir) unless File.exist?(dir)
    
    random_token = Digest::SHA2.hexdigest("#{Time.now.utc}").first(20)
    fileExt = File.extname(uploaded_io.original_filename)
    imageName = random_token+fileExt
    imageName = File.basename(imageName)         
    imageName.sub(/[^\w\.\-]/,'_')
        
    File.open(Rails.root.join('public', 'uploads', 'tmp', imageName), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    
    ## scale this image to a specific area
    source_path = Rails.root.join('public', 'uploads', 'tmp', imageName)
    require 'mini_magick'
    buffer = StringIO.new(File.open(source_path,"rb") { |f| f.read })
    image = MiniMagick::Image.read(buffer)
    image.resize "350X350"
    image.write "public/uploads/tmp/"+imageName.to_s
    
    render :json => { :files => [ { :name => imageName, :type => uploaded_io.content_type}] }
  end
  
  def check_email
    
    if params[:email].present?
      user_email = params[:email]
    else
      user_email = params[:user][:email]
    end
    
    userExist = User.where("email = ?", user_email).count
    
    if(userExist > 0)
      render text: "false"
    else
      render text: "true"
    end
    
  end
  
  #added by sam for updating last activity time
  def current_user
    @current_user ||= super
    if @current_user != nil && @current_user.id > 0
      loggedInUser = User.find(@current_user.id)
      loggedInUser.update(:lastlogintime=>Time.now.to_i)#save the current login time      
    end
    @current_user
  end

  protected
  def layout_by_resource
    if @current_user != nil && @current_user.id > 0
      loggedInUser = User.find(@current_user.id)
      loggedInUser.update(:lastlogintime=>Time.now.to_i)#save the current login time      
    end
    if controller_name == 'admin'
      'admin_layouts'
    end
  end
  
  def is_user_artist?
    if current_user.nil? || current_user.user_type!="artist"
      redirect_to root_path, alert: 'Invalid request'
    end
  end
  
  def is_user_fan?
    if current_user.nil? || current_user.user_type!="fan"
      redirect_to root_path, alert: 'Invalid request'
    end
  end
  
end