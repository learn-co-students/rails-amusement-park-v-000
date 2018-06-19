class RidesController < ApplicationController

  def new
    ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    ride.update_user
    flash[:success] = "Thanks for riding the #{ride.attraction.name}!"

    redirect_to ride.user
  end


end
