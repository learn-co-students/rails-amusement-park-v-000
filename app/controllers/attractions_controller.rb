class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def ride
    Ride.create(params)
  end

  private

  def ride_params
    params.permit("user_id", "attraction_id")
  end


end
