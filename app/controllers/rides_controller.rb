class RidesController < ApplicationController

def new
  ride = Ride.new(attraction_id: params[:attraction_id], user_id: params[:user_id])
  ride.save
  ride.take_ride
  
  redirect_to user_path(current_user)
end




end
