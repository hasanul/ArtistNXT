class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_filter :load_user, except: [:read]
  before_filter :authenticate_user!, except: [:read]
  before_filter :is_user_artist?, only: [:index, :new, :create]

  # GET /news
  # GET /news.json
  def index
    @news = @user.news.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /news/1
  # GET /news/1.json
  def show
    
    # update hits
    @news.update_attributes(:hits => @news.hits.to_i + 1)
  end

  # GET /news/new
  def new
    @news = @user.news.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = @user.news.create(news_params)
    @news.published = 1

    respond_to do |format|
      if @news.save
        format.html { redirect_to user_news_index_url, notice: 'News was successfully created.' }
        format.json { render action: 'show', status: :created, location: @news }
      else
        format.html { render action: 'new' }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to user_news_url, notice: 'News was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to user_news_index_url, notice: 'News was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  def read
    @news = News.find(params[:id])
    # update hits
    @news.update_attributes(:hits => @news.hits.to_i + 1)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
      if current_user.nil? || @news.user_id!=current_user.id
        redirect_to root_path, alert: 'Invalid request'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:user_id, :title, :desc, :news_image, :published, :featured, :hits)
    end
    
    def load_user
      @user = User.find(params[:user_id])
    end
end
