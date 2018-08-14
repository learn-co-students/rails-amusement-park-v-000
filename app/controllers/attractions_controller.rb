class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
    @attraction = Attraction.find_by(id: params[:id])
  end
end
