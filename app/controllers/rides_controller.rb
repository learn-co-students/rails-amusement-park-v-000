class RidesController < ApplicationController

  def new
    ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @message = ride.take_ride
    flash[:notice] = @message
    redirect_to ride.user
  end

end
