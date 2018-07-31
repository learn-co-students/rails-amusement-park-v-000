class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def ride
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @ride.take_ride
    redirect_to user_path(@ride.user)
  end

  # private
  #
  # def ride_params
  #   params.permit("user_id", "attraction_id")
  # end


end
