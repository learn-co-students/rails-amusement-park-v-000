class RidesController < ApplicationController

def ride
    @attraction = Attraction.find(params[:id])
    @ride = Ride.create(:user_id => current_user.id, :attraction_id => @attraction.id)
    ride_authorization = @ride.take_ride
    if ride_authorization == true
      flash[:successful_ride] = "Thanks for riding the #{@attraction.name}!"
      redirect_to user_path(current_user)
    else
      flash[:failed_ride] = ride_authorization
      redirect_to user_path(current_user)
    end
  end

end
