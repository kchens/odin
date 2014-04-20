class EventsController < ApplicationController
  @events = Event.all
  

  def index
    @events
    # @past_events = @upcoming_events = [] 
    # @events.each do |e|
    #   @past_events << e if e.day < @lunch.day
    #   @upcoming_events << e if e.day >= @lunch.day
    # end

    @past_events = Event.past_events
    @upcoming_events = Event.upcoming_events
  end

  def new
  end

  def create
  	@event = current_user.events.build(event_params)
  	if @event.save
  		flash[:success] = "You created an event"
  		redirect_to events_path
  	else
		redirect_to new_event_path
  	end
  end

  def show
  	@event = Event.find(params[:id])
  end

  # def Event.past_events
  #   # where date < @lunch.day
  #   where('day < ? ', Date.new + 5) 
  # end

  # def Event.upcoming_events
  #   where('day >= ? ', Date.new + 5)
  # end

  private

  	def event_params
  		params.require(:event).permit(:description)
  	end

end