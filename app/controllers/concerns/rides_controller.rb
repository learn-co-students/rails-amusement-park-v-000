class RidesController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @ride = Ride.new
    @ride.user_id = session[:user_id]
    @ride.attraction_id = params[:attraction_id]
    @message = @ride.take_ride
    redirect_to user_path(@ride.user, message: @message)
  end
end
