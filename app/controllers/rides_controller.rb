class RidesController < ApplicationController
  def create
    @ride = Ride.new
    @ride.user = User.find(session[:user_id])
    @ride.attraction = Attraction.find(params[:attraction_id])
    @ride.save
    flash[:message] = @ride.take_ride
    redirect_to user_path(@ride.user)
  end 
end 