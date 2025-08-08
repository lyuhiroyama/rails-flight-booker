class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport", foreign_key: "origin_id", inverse_of: :departing_flights
  belongs_to :arrival_airport, class_name: "Airport", foreign_key: "destination_id", inverse_of: :arriving_flights

  has_many :bookings
end
