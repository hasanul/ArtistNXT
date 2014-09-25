class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_filter :load_user, except: [:watch, :remove_watch, :clear_watch_list]
  before_filter :authenticate_user!, except: [:watch]
  before_filter :is_user_artist?, only: [:new, :create, :index]
  
  # GET /videos
  # GET /videos.json
  def index
    @videos = @user.videos.order('created_at DESC').all
    @video = @user.videos.new
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    
    # update hits
    @video.update_attributes(:hits => @video.hits.to_i + 1)
  end

  # GET /videos/new
  def new
    @video = @user.videos.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    
    catids = params[:catid]   
    @video = @user.videos.create(video_params)
    @video.published = 1
    @video.featured = 0
    
    respond_to do |format|
      if @video.save
        if @video!=nil && catids != nil && catids.kind_of?(Array)
          catids.each do |catid|        
            MusicCategoriesVideos.create(:music_category_id => catid,:video_id=>@video.id)
          end  
        end
        format.html { redirect_to user_videos_url, notice: 'Video was successfully created.' }
        format.json { render action: 'show', status: :created, location: @video }
      else
        format.html { render action: 'new' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    Comment.where('video_id=?',@video.id).delete_all()
    @video.destroy
    respond_to do |format|
      format.html { redirect_to user_videos_url, notice: 'Video was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  def watch
    
    @video = Video.find(params[:id])
    @isFavoriteVideo = 0;
    # update hits
    if current_user != nil
      @userIP = request.remote_ip      
      lastWatchedVideo = VideoWatch.where("user_id=?",current_user.id).order('created_at DESC').take
      insertWatchRow = true
      if lastWatchedVideo != nil && lastWatchedVideo.video_id.to_i == params[:id].to_i
        insertWatchRow = false
      end
      if insertWatchRow        
        VideoWatch.create(:video_id=>params[:id],:user_id=>current_user.id,:ip=>@userIP)        
      end
      @isFavoriteVideo = VideoFavorite.where("user_id=? AND video_id=?",current_user.id,params[:id]).count();
    end
    
    @relatedVideos = nil
    videoCats = MusicCategoriesVideos.where("video_id=?",params[:id]).select("music_category_id")
    catdIdStr = ""
    @videoCatNames = ""
    if videoCats.length > 0        
      videoCats.each do |catIDRow|
        if catdIdStr.blank?
          catdIdStr = catIDRow["music_category_id"].to_s
          catDetails = MusicCategory.where("id=?",catIDRow["music_category_id"]).take;
          if !catDetails.nil?
            @videoCatNames = catDetails.name
          end
        else
          catdIdStr = catdIdStr+","+catIDRow["music_category_id"].to_s
          catDetails = MusicCategory.where("id=?",catIDRow["music_category_id"]).take;
          if !catDetails.nil?
            @videoCatNames = @videoCatNames+", "+catDetails.name
          end
        end
      end
      @relatedVideos = Video.where("videos.published=1 AND videos.id!=?",params[:id])
      @relatedVideos = @relatedVideos.joins('INNER JOIN music_categories_videos ON music_categories_videos.video_id = videos.id')
      @relatedVideos = @relatedVideos.where("music_categories_videos.music_category_id IN(?)",catdIdStr.split(',').map(&:to_i)).distinct().order('videos.created_at DESC').limit(Rails.application.config.related_video_count)      
    end
    
    @video.update_attributes(:hits => @video.hits.to_i + 1)
    @comments = Comment.where("video_id=?",@video.id).order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    @videoCreator = User.find(@video.user_id)
    
    @pageMetaTitle = @video.title;
    if !@videoCatNames.blank?
      @pageMetaTitle = @pageMetaTitle+ ", "+@videoCatNames
    end
    @pageMetaDescription = @video.desc.to_s
    if @pageMetaDescription.blank?
      @pageMetaDescription = @video.title;
    end
    if @video.source.to_s.eql?("remote")
      if !@pageMetaDescription.to_s.blank?
        @pageMetaDescription = @pageMetaDescription +"-"+ request.url
      end
    end
  end
  
  def remove_watch
    vid = params[:id]    
    already_favorite_row = VideoWatch.where("user_id=? AND video_id=?",current_user.id,vid).take;
    
    if already_favorite_row != nil
      
      already_favorite_row.destroy()
      flash[:notice] = "Removed from your watch list."
      
      if params[:return_url].present?
        redirect_to(Base64.decode64(params[:return_url])) and return
      else
        redirect_to(watch_video_path(:id=>vid)) and return
      end
      
    else
      redirect_to('/') and return
    end
  end
  
  def clear_watch_list
    
      VideoWatch.where("user_id=?",current_user.id).delete_all()
      
      flash[:notice] = "Your watch list has been cleared."
        
      if params[:return_url].present?
        redirect_to(Base64.decode64(params[:return_url])) and return
      else
        redirect_to('/') and return
      end
    
  end
  
  def make_favorite
    vid = params[:id]    
    already_favorite = VideoFavorite.where("user_id=? AND video_id=?",current_user.id,vid).count();
    if already_favorite > 0
      flash[:alert] = "This is already your favorite video."
      redirect_to(watch_video_path(:id=>vid)) and return
    else
      VideoFavorite.create(:video_id=>params[:id],:user_id=>current_user.id)
      flash[:notice] = "Successfully added as your favorite video."
      redirect_to(watch_video_path(:id=>vid)) and return
    end
  end
  
  def remove_favorite
    vid = params[:id]    
    already_favorite_row = VideoFavorite.where("user_id=? AND video_id=?",current_user.id,vid).take;
    
    if already_favorite_row != nil
      
      already_favorite_row.destroy()
      flash[:notice] = "Removed from your favorite list."
      
      if params[:return_url].present?
        redirect_to(Base64.decode64(params[:return_url])) and return
      else
        redirect_to(watch_video_path(:id=>vid)) and return
      end
      
    else
      redirect_to('/') and return
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
      if current_user.nil? || @video.user_id!=current_user.id
        redirect_to root_path, alert: 'Invalid request'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:user_id, :title, :desc, :source, :path, :remote_path, :published, :featured, :hits, :catid)
    end
    
    def load_user
      @user = User.find(params[:user_id])
    end    
    
end