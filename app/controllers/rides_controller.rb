class RidesController < ApplicationController
  def new

    attraction = Attraction.find_by(id: params[:attraction_id])
    @ride = Ride.create(ride_params)
    flash[:message] = @ride.take_ride
    redirect_to user_path(@ride.user)
    #binding.pry
  end

  def create

  end

  private

  def ride_params
    params.permit(:user_id, :attraction_id)
  end
end
