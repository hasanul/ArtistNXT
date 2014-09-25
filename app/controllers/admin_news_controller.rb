class AdminNewsController < ApplicationController
  before_action :set_admin_news, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :is_admin
  protect_from_forgery except: :save_ordering
  layout 'admin_layouts'

  # GET /admin_news
  # GET /admin_news.json
  def index
    @search = params[:search].to_s
    if @search.length > 0
      searchText = '%'+@search+'%'
      @admin_news = AdminNews.where("title LIKE ?",searchText).order('ordering ASC').paginate(:page => params[:page], :per_page => 10)
    else
      @admin_news = AdminNews.order('ordering ASC').paginate(:page => params[:page], :per_page => 10)    
    end
  end

  # GET /admin_news/1
  # GET /admin_news/1.json
  def show
  end

  # GET /admin_news/new
  def new
    @admin_news = AdminNews.new
  end

  # GET /admin_news/1/edit
  def edit
  end

  # POST /admin_news
  # POST /admin_news.json
  def create
    @admin_news = AdminNews.new(admin_news_params)
    
    max_ordering = AdminNews.maximum("ordering")
    @admin_news.ordering = max_ordering.to_i + 1

    respond_to do |format|
      if @admin_news.save
        format.html { redirect_to @admin_news, notice: 'News was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin_news }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin_news/1
  # PATCH/PUT /admin_news/1.json
  def update
    respond_to do |format|
      if @admin_news.update(admin_news_params)
        format.html { redirect_to @admin_news, notice: 'News was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_news/1
  # DELETE /admin_news/1.json
  def destroy
    @admin_news.destroy
    respond_to do |format|
      format.html { redirect_to admin_news_index_url, notice: 'News was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  def save_ordering
    orderingData = params[:ordering]

    if orderingData!=nil && orderingData.length > 0
      orderingData.each do |orderItem|
        planRow = AdminNews.where("id = ?",orderItem[0]).take
        if planRow!=nil
          planRow.update(:ordering=>orderItem[1])
        end
      end
      flash[:notice] = "Ordering was successfully saved."
      redirect_to(admin_news_index_path) and return
    else
      redirect_to('/') and return
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_news
      @admin_news = AdminNews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_news_params
      params.require(:admin_news).permit(:title, :text, :published, :hits, :created_by, :updated_by, :ordering)
    end
    
    def is_admin
      if current_user.role != 'administrator'
        flash[:alert] = 'You are not authorized to view this resource!'
        redirect_to(root_path)
      end
    end
end
