class RidesController < ApplicationController
  def new
  end

  def create
    @user = User.find(params[:user_id])
    ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    flash[:notice] = ride.take_ride
    redirect_to @user
  end

end
