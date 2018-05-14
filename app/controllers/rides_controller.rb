class RidesController < ApplicationController

  def new
  end

  def create
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @attraction = Attraction.find_by(id: params[:attraction_id])
    user = User.find_by(id: params[:user_id])
    thing = @ride.take_ride
    flash[:notice] = "#{thing}"
    redirect_to user_path(params[:user_id])
  end
end
