class RidesController < ApplicationController
  def new
    @ride = Ride.new
  end

  def create
    binding.pry
    user = User.find(session[:user_id])
    attraction = Attraction.find(params[:ride][:attraction_id])
    @ride = Ride.new
    @ride.user = user
    @ride.attraction = attraction
    binding.pry
    @ride.take_ride
    redirect_to user_path(user)
  end
end
