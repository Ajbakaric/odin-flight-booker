# app/controllers/bookings_controller.rb

class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)
    @booking.passengers.build
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def show
    @booking = Booking.find_by(id: params[:id])
    unless @booking
      flash[:alert] = "Booking not found"
      redirect_to root_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email, :_destroy])
  end
end
