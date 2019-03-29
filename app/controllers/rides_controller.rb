require 'pry'
class RidesController < ApplicationController

  def new
    @ride = Ride.new
  end


  def create
  @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @message= @ride.take_ride
    redirect_to user_path(@ride.user, message: @message)
  end


#  def update
#    @ride = Ride.find_by(id:params[:id])
#    if @ride.update(params[:ride_params])
#      redirect_to users_path
#    else
#      render :edit
#    end
#  end
end
