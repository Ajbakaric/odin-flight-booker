# In your PassengerMailer
class PassengerMailer < ApplicationMailer
    def confirmation_email(passenger, ticket)
      @passenger = passenger
      @ticket = ticket
      mail(to: @passenger.email, subject: 'Flight Booking Confirmation')
    end
  end
  