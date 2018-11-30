require 'pry'
class RidesController < ApplicationController

  def new


  end

  def create
    @ride = Ride.create(attraction_id: params[:attraction][:attraction_id])
    @user = User.find_by(id: params[:attraction][:user_id])
    @ride.user_id = @user.id
    @ride.save

    @ride.take_ride

    redirect_to user_path(@user)
  end

end
