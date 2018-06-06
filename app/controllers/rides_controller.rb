class RidesController < ApplicationController

  def takeride
    ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])
    message = ride.take_ride
    redirect_to user_path(current_user), notice: "#{message}"
  end
end
