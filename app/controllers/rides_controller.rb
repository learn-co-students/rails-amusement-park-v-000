require 'pry'
class RidesController < ApplicationController
  def create
    #binding.pry
    @ride = Ride.create(attraction_id: params[:att_id], user_id: session[:user_id])
    @ride.take_ride
    @user = User.find_by(id: session[:user_id])
    redirect_to user_path(@user)
  end
end
