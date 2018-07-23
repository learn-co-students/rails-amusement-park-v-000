class RidesController < ApplicationController
  def new
    @ride = Ride.new
  end

  def create
    #binding.pry
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:ride][:attraction_id])
    @ride = Ride.new
    @ride.user = @user
    @ride.attraction = @attraction
    #@ride.take_ride
    @user.rides << @ride
    #@user.save
    #binding.pry
    redirect_to user_path(@user)
  end
end
