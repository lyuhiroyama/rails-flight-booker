class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @search_performed = params.except(:controller, :action).present?

    if @search_performed
      @flights = @flights.where(origin_id: params[:origin_id]) if params[:origin_id].present?
      @flights = @flights.where(destination_id: params[:destination_id]) if params[:destination_id].present?
      @flights = @flights.where("DATE(departure_time) = ?", params[:departure_time]) if params[:departure_time].present?
    end
  end
end
