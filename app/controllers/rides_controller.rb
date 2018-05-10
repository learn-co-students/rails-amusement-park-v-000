class RidesController < ApplicationController
  def index
  end

  def new
  end

  def create
    ride = Ride.new(user_id: current_user.id, attraction_id: params[:id])
    ride.save
    flash[:notice] = ride.take_ride
    redirect_to user_path(current_user)
  end
end
