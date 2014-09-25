class SlidesController < ApplicationController
  before_action :set_slide, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  protect_from_forgery except: :save_ordering
  layout 'admin_layouts'
  
  def new
    @slide = Slide.new
    @form_action = 'create'
  end
  
  def create
    @slide = Slide.new(slide_params)

    respond_to do |format|
      if @slide.save
        format.html { redirect_to @slide, notice: 'Slide was successfully created.' }
        format.json { render action: 'show', status: :created, location: @plan }
      else
        format.html { render action: 'new' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @form_action = 'update'
  end
  
  def update
    respond_to do |format|
      if @slide.update(slide_params)
        format.html { redirect_to @slide, notice: 'Slide was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @slide.destroy
    respond_to do |format|
      format.html { redirect_to admin_slides_path, notice: 'Slide was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  def save_ordering
    orderingData = params[:ordering]

    if orderingData!=nil && orderingData.length > 0
      orderingData.each do |orderItem|
        slideRow = Slide.where("id = ?",orderItem[0]).take
        if slideRow!=nil
          slideRow.update(:ordering=>orderItem[1])
        end
      end
      flash[:notice] = "Ordering was successfully saved."
      redirect_to(admin_slides_path) and return
    else
      redirect_to('/') and return
    end
    
  end
  
  private
  def set_slide
    @slide = Slide.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def slide_params
    params.require(:slide).permit(:title, :desc,:slide_image, :published)
  end
end
