class RidesController < ApplicationController

  def create
    @ride = Ride.create(user: current_user, attraction_id: params[:attraction_id])
    flash[:message] = @ride.take_ride
    redirect_to user_path(current_user)
  end

end
