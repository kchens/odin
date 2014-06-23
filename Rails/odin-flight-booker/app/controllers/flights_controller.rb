class FlightsController < ApplicationController
  def index
    @search = Flight.search(params)
    @airports = Airport.all.map { |x| x.codename }
    @num_passengers = (1..4).map { |x| x }
    @dates = Flight.all.map {|x| x.formatted_date}

    
  end
end