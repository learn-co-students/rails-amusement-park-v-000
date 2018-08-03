class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.create(user_id: params[:ride][:user_id],attraction_id: params[:ride][:attraction_id])
    @user = User.find_by_id(params[:ride][:user_id])
    @message = @ride.take_ride
   redirect_to user_path(@user , message: @message)
  end
end
