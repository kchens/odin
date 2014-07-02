class BookingsController < ApplicationController
  def new
    
    @flight = Flight.find(params[:flight_id])
    @booking = @flight.bookings.build

    params[:passengers].to_i.times { @booking.passengers.build }
    @booking.passengers.build if params[:passengers].blank? 
    redirect_to root_path if params[:flight_id].nil?
  end

  def create
    @booking = Booking.create(booking_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
  end
end