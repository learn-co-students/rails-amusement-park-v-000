class RidesController < ApplicationController
  before_action :require_logged_in

  def show
    @ride = Ride.find(params[:id])
  end

  def create
    ride = Ride.create(attraction_id: params[:attraction], user_id: params[:user])
    message = ride.take_ride
    redirect_to user_path(@user), flash: { message:message }
  end



end
