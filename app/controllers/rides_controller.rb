class RidesController < ApplicationController
  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
    redirect_to attractions_url
  end
end
