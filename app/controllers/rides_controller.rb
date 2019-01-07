class RidesController < ApplicationController
  def create
    if helpers.current_user == params[:user_id].to_i
      ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
      if ride.valid?
        ride.take_ride
        redirect_to user_path(params[:user_id])
      end
    end
    redirect_to attraction_path(params[:attraction_id]) if Attraction.find(params[:attraction_id])
    redirect_to root_path
  end
end
