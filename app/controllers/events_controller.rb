class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_filter :load_user, except: [:details]
  before_filter :authenticate_user!, except: [:details]
  before_filter :is_user_artist?, only: [:index, :new, :create]
  
  # GET /events
  # GET /events.json
  def index
    @events = @user.events.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    
    
    # update hits
    @event.update_attributes(:hits => @event.hits.to_i + 1)
  end

  # GET /events/new
  def new
    @event = @user.events.new
  end

  # GET /events/1/edit
  def edit
    @event.start_date  =  @event.start_date.to_time.utc.strftime('%Y-%m-%d %H:%M:%S')
    @event.end_date  =  @event.end_date.to_time.utc.strftime('%Y-%m-%d %H:%M:%S')
  end

  # POST /events
  # POST /events.json
  def create
    @event = @user.events.create(event_params)
    @event.published = 1

    respond_to do |format|
      if @event.save
        format.html { redirect_to user_events_url, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to user_events_url, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to user_events_url, notice: 'Event was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  
  def details
    @event = Event.find(params[:id])
    # update hits
    @event.update_attributes(:hits => @event.hits.to_i + 1)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      if current_user.nil? || @event.user_id!=current_user.id
        redirect_to root_path, alert: 'Invalid request'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:user_id, :title, :desc, :event_image, :published, :featured,:hits,:start_date,:end_date,:hits,:location,:latitude,:longitude )
    end
    
    def load_user
      @user = User.find(params[:user_id])
    end    
end
