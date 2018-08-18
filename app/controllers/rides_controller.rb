class RidesController < ApplicationController

  def new
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    redirect_to user_path(@ride.user.id, session[:ride_message] => @ride.take_ride)
  end

end
