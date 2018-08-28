class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(params[:id])
    @ride = Ride.find_by(attraction_id: @attraction.id)
  end
end
