class FlightsController < ApplicationController
  def index
    @airports = Airport.all
    @flights = Flight.all

    if params[:departure_code].present? && params[:arrival_code].present? && params[:date].present?
      begin
        departure_airport_id = params[:departure_code].to_i
        arrival_airport_id = params[:arrival_code].to_i
        date = Date.new(params[:date]["start_datetime(1i)"].to_i,
                        params[:date]["start_datetime(2i)"].to_i,
                        params[:date]["start_datetime(3i)"].to_i)

        @flights = @flights.where(departure_airport_id: departure_airport_id)
                           .where(arrival_airport_id: arrival_airport_id)
                           .where(start_datetime: date.beginning_of_day..date.end_of_day)
      rescue ArgumentError => e
        flash[:error] = "Invalid date format"
        redirect_to root_path
      end
    end
  end
end
