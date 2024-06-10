class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers, dependent: :destroy # Remove this line if you already have it defined
  accepts_nested_attributes_for :passengers, allow_destroy: true
  validates :flight_id, presence: true

  def ticket
    "Flight from #{flight.departure_airport.code} to #{flight.arrival_airport.code} on #{flight.start_datetime.strftime("%B %d, %Y %H:%M")}"
  end
end
