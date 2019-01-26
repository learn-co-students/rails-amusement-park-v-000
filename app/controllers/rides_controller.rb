class RidesController < ApplicationController

  def create
    @ride = Ride.create(attraction_id: params[:attraction_id], user_id: params[:user_id])
    @message = @ride.take_ride
    redirect_to user_path(@ride.user_id)
    flash[:message] = @message

  end
end
