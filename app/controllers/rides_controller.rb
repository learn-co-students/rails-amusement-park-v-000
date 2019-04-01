require 'pry'
class RidesController < ApplicationController

  def create
    @attraction = Attraction.find(params[:attraction_id])
    @ride = current_user.rides.create(attraction: @attraction)
    #Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    flash[:notice]=@ride.take_ride

    redirect_to user_path(@ride.user)
  end
end
