class FlightsController < ApplicationController
  def index
    # @airports = Airport.all.map {|x| x.code }
    @airports = Airport.pluck(:code, :id)
    @dates = Flight.all.map {|x| x.formatted_date }
    @passengers = (1..4).map { |x| x}

    @flights = Flight.search(params)
  end

end