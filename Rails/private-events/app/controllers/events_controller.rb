class EventsController < ApplicationController
  include SessionsHelper
 
  def index
  	@events = Event.all
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

  private

  	def event_params
  		params.require(:event).permit(:description)
  	end

  	# def correct_user
  	# 	@event = current_user.events.find_by(id: params[:id])
  	# 	redirect_to root_url if @event.nil?
  	# end
end