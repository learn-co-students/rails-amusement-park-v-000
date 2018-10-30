require 'pry'
require 'rack-flash'

class RidesController < ApplicationController
  def create
    #binding.pry
    @ride = Ride.create(attraction_id: params[:att_id], user_id: session[:user_id])
    @attraction = Attraction.find_by(id: params[:att_id])
    @user = User.find_by(id: session[:user_id])
    message = @ride.take_ride
    #binding.pry
      if message == true
        flash[:notice] = "Thanks for riding the #{@attraction.name}!"
        redirect_to user_path(@user)
      else
        flash[:notice] = message
        redirect_to user_path(@user)
      end
  end


end
