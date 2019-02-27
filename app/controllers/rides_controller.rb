class RidesController < ApplicationController

  def create
    user = User.find(params[:user_id])
    attraction = Attraction.find(params[:attraction_id])
    ride = Ride.create(user: user, attraction: attraction)

    flash[:message] = ride.take_ride
    redirect_to user_path(user)
  end

end
