class BookingsController < ApplicationController
  def new 
    @flight = Flight.find(params[:flight_id])
    @num_passengers = params[:num_passengers].to_i

    @booking = Booking.new(flight: @flight)

    # Blank Passenger objects for the form
    @num_passengers.times do
      @booking.passengers.build
    end
  end

  def create 

  end
end
