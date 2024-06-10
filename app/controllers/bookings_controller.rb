class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)
    @booking.passengers.build
  end
  
  def create
    @booking = Booking.new(booking_params)
    passenger_attributes = booking_params[:passengers_attributes].values.first
    if passenger_attributes
      @booking.passengers.build(passenger_attributes)
    end
  
    if @booking.save
      # Send confirmation email
      PassengerMailer.confirmation_email(@booking.passengers.first, @booking.ticket).deliver_now if @booking.passengers.present?
      redirect_to @booking, notice: 'Flight booking created successfully.'
    else
      render :new
    end
  end
  

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email, :_destroy])
  end
end
