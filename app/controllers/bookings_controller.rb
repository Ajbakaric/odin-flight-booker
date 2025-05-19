class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)
    @booking.passengers.build
  end

  def create
  @booking = Booking.new(booking_params)

  # Safely handle the case where passengers_attributes is nil
  if booking_params[:passengers_attributes].present?
    passenger_attributes = booking_params[:passengers_attributes].values.first
    @booking.passengers.build(passenger_attributes) if passenger_attributes
  end

  if @booking.save
    # Send confirmation email
    if @booking.passengers.present?
      PassengerMailer.confirmation_email(@booking.passengers.first, @booking.ticket).deliver_now
    end
    redirect_to @booking, notice: 'Flight booking created successfully.'
  else
    render :new
  end
end


  def show
    @booking = Booking.find_by(id: params[:id])
    if @booking.nil? || @booking.flight.nil?
      redirect_to root_path, alert: "Booking not found or flight missing."
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email, :_destroy])
  end
end
