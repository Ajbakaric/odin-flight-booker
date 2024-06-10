class PassengersController < ApplicationController
    def create
      @passenger = Passenger.new(passenger_params)
      if @passenger.save
        PassengerMailer.confirmation_email(@passenger).deliver_now
        redirect_to @passenger, notice: 'Passenger was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def passenger_params
      params.require(:passenger).permit(:name, :email)
    end
  end
  