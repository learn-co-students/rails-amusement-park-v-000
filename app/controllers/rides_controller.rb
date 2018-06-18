class RidesController < ApplicationController
  def new

    attraction = Attraction.find_by(id: params[:attraction_id])
    @ride = Ride.create(ride_params)
    redirect_to user_path(@ride.user)
    flash[:message] = @ride.take_ride
    #binding.pry
  end

  def create

  end

  private

  def ride_params
    params.permit(:user_id, :attraction_id)
  end
end
