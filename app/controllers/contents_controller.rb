class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :is_admin
  protect_from_forgery except: :save_ordering
  layout 'admin_layouts'

  # GET /contents
  # GET /contents.json
  def index
    @search = params[:search].to_s
    if @search.length > 0
      searchText = '%'+@search+'%'
      @contents = Content.where("title LIKE ?",searchText).order('ordering ASC').paginate(:page => params[:page], :per_page => 10)
    else
      @contents = Content.order('ordering ASC').paginate(:page => params[:page], :per_page => 10)    
    end
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
  end

  # GET /contents/new
  def new
    @content = Content.new
    @form_action = 'create'
  end

  # GET /contents/1/edit
  def edit
    @form_action = 'update'
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)
    
    @content.alias = @content.title.parameterize

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @content }
      else
        format.html { render action: 'new' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    #render text: content_params and return
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def content_params
      params.require(:content).permit(:title, :alias, :text, :published, :hits, :ordering, :position)
    end
    
    def is_admin
      if current_user.role != 'administrator'
        flash[:alert] = 'You are not authorized to view this resource!'
        redirect_to(root_path)
      end
    end
end
