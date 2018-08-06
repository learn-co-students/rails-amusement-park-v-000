class RidesController < ApplicationController
  def create
    ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    ride.save
    @user = User.find(ride.user.id)
    @attraction = Attraction.find(params[:attraction_id])
    flash[:message] = ride.take_ride
    redirect_to user_path(@user)
  end
end
