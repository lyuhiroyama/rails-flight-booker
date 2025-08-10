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
    @booking = Booking.new(booking_params)
    # -> Also replaces empty passenger objects from #new with submitted passenger attributes
    if @booking.save
      redirect_to @booking, notice: "Booking successfully created"
    else
      render :new
    end
  end

  private

  def booking_params
    params.expect(
      booking: [ :flight_id, passengers_attributes: [ [ :name, :email ] ]
  ])
  end
end
