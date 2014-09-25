class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :is_admin
  protect_from_forgery except: :save_ordering
  layout 'admin_layouts'

  # GET /plans
  # GET /plans.json
  def index
    @search = params[:search].to_s
    if @search.length > 0
      searchText = '%'+@search+'%'
      @plans = Plan.where("name LIKE ?",searchText).order('ordering ASC').paginate(:page => params[:page], :per_page => 10)
    else
      @plans = Plan.order('ordering ASC').paginate(:page => params[:page], :per_page => 10)    
    end
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
    @form_action = 'create'
  end

  # GET /plans/1/edit
  def edit
    @form_action = 'update'
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)
    
    max_ordering = Plan.maximum("ordering")
    @plan.ordering = max_ordering.to_i + 1

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
        format.json { render action: 'show', status: :created, location: @plan }
      else
        format.html { render action: 'new' }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  def save_ordering
    orderingData = params[:ordering]

    if orderingData!=nil && orderingData.length > 0
      orderingData.each do |orderItem|
        planRow = Plan.where("id = ?",orderItem[0]).take
        if planRow!=nil
          planRow.update(:ordering=>orderItem[1])
        end
      end
      flash[:notice] = "Ordering was successfully saved."
      redirect_to(plans_path) and return
    else
      redirect_to('/') and return
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:name, :desc, :is_free, :price, :period, :period_unit, :published)
    end
    
    def is_admin
      if current_user.role != 'administrator'
        flash[:alert] = 'You are not authorized to view this resource!'
        redirect_to(root_path)
      end
    end
    
end
