class FlightsController < ApplicationController
  def index
    # @airports = Airport.all.map {|x| x.code }
    @airports = Airport.pluck(:code, :id)
    @dates = Flight.flight_dates
    @passengers = (1..4).map { |x| [x, x]}
    @flights = Flight.search(params)
    puts "in flight controller"
    puts @flights
    puts @flights.count
  end
end