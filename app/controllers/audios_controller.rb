class AudiosController < ApplicationController
  before_action :set_audio, only: [:show, :edit, :update, :destroy]  
  before_filter :authenticate_user!
  before_filter :load_user
  before_filter :is_user_artist?, only: [:new, :create, :index]
  
  # GET /audios
  # GET /audios.json
  def index
    @audios = @user.audios.all
    @audio = @user.audios.new
  end

  # GET /audios/1
  # GET /audios/1.json
  def show
    
    # update hits
    @audio.update_attributes(:hits => @audio.hits.to_i + 1)
  end

  # GET /audios/new
  def new
    @audio = @user.audios.new
  end

  # GET /audios/1/edit
  def edit
  end

  # POST /audios
  # POST /audios.json
  def create
    
    catids = params[:catid]        
    
    @audio = @user.audios.create(audio_params)
    @audio.published = 1
    if @audio.price.blank? or @audio.price.to_i.eql?(0)
      @audio.is_free = 1
      @audio.price = 0;
    else
      @audio.is_free = 0
    end
    
    
    respond_to do |format|
      if @audio.save
        if @audio!=nil && catids != nil && catids.kind_of?(Array)
          catids.each do |catid|        
            AudiosMusicCategories.create(:music_category_id => catid,:audio_id=>@audio.id)
          end  
        end
        format.html { redirect_to user_audios_url, notice: 'Audio was successfully created.' }
        format.json { render action: 'show', status: :created, location: @audio }
      else
        format.html { render action: 'new' }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /audios/1
  # PATCH/PUT /audios/1.json
  def update
    respond_to do |format|
      if @audio.update(audio_params)
        format.html { redirect_to user_audios_url, notice: 'Audio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /audios/1
  # DELETE /audios/1.json
  def destroy
    @audio.destroy
    respond_to do |format|
      format.html { redirect_to user_audios_url, notice: 'Audio was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_audio
      @audio = Audio.find(params[:id])
      if current_user.nil? || @audio.user_id!=current_user.id
        redirect_to root_path, alert: 'Invalid request'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def audio_params
      params.require(:audio).permit(:user_id, :title, :desc, :path, :published, :featured, :hits, :catid, :is_free, :price, :is_downloadable)
    end
    
    def load_user
      @user = User.find(params[:user_id])
    end
end
