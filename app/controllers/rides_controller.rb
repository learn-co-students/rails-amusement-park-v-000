require 'pry'

class RidesController < ApplicationController
  def create
    ride = Ride.new(user_id: params[:ride][:user_id], attraction_id: params[:ride][:attraction_id])
    took_ride = ride.take_ride
    attraction = Attraction.find(params[:ride][:attraction_id])
    if took_ride == true
      flash[:notice] = "Thanks for riding the #{attraction.name}!"
    else
      flash[:notice] = took_ride
    end
    redirect_to user_path(current_user.id)
  end
end
