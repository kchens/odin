class FlightsController < ApplicationController
  def index
    @airports = Airport.pluck(:code, :id)
    @dates = Flight.flight_dates
    @passengers = (1..4).map { |x| [x.to_s, x]}
    @flights = Flight.search(params)
    if @flights.none? 
      flash[:error] = "No flights."
    else
      flash[:success] = "Check flights below."
    end
  end
end