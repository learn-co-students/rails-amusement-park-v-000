class RidesController < ApplicationController

  def create
    @ride = Ride.new
    @ride.user = User.find(session[:user_id])
    @ride.attraction = Attraction.find(params[:attraction_id])
    message = @ride.take_ride
    @ride.save
    @user = @ride.user
    @attraction = @ride.attraction
    #binding.pry
    flash[:notice] = message
    redirect_to user_path(@user)
  end

end
