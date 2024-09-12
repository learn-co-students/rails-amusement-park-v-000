
class RidesController < ApplicationController
  def create
    @ride = Ride.new(ride_params)
    ride_result = @ride.take_ride
    if ride_result == true
      flash[:successful_ride] = "Thanks for riding the #{Attraction.find(params[:ride][:attraction_id]).name}!"
      redirect_to user_path(current_user)
    else
      flash[:failed_ride] = ride_result
      redirect_to user_path(current_user)
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end