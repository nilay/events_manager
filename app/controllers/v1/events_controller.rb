class V1::EventsController < V1::BaseController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /v1/events
  def index
    render json: {success: true, events: ActiveModel::Serializer::CollectionSerializer.new(Event.published.page(current_page).per(record_per_page), serializer: EventSerializer)}
    
  end

  # GET /v1/events/1
  def show
   render json: {succss: true, event: EventSerializer.new(@event) }
  end

 
  # POST /v1/events
  def create

    event = Event.new(event_params)
    # for strange reason, it is set as true
    event.deleted = false
    if event.save
      render json: {success: true, message: "Event created successfully",  data: EventSerializer.new(event)}
    else
      render json: {success: false, message: event.errors.full_messages.join(', ') }  
    end  

  end

  # PATCH/PUT /v1/events/1
  def update
    if @event.update event_params
      render json: {success: true, message: "Event updated successfully",  data: EventSerializer.new(@event)}
    else
      render json: {success: false, message: @event.errors.full_messages.join(', ') }  
    end  
  end

  # DELETE /v1/events/1
  def destroy
    if @event.update({deleted: true})
      render json: {success: true, message: "Event deleted successfully",  data: @event}
    else
      render json: {success: false, message: @event.errors.full_messages.join(', ') }  
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

  # Only allow a trusted parameter "white list" through.
  def event_params
    params.require(:event).permit(:name, :description, :location, :start_date, :end_date, :status)
  end
end
