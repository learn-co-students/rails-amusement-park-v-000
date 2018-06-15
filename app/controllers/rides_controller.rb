class RidesController < ApplicationController
  def new
    @ride = Ride.new
  end

  def create
   binding.pry
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    redirect_to user_path(@ride.user), alert: "#{@ride.take_ride}"
  end


end
