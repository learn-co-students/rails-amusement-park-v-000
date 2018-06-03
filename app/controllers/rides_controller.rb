class RidesController < ApplicationController
  def new
  end

  def create
    #raise params.inspect
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @attraction = Attraction.find(params[:attraction_id])
    flash[:notice] = @ride.take_ride
    redirect_to user_path(params[:user_id])
  end

end
