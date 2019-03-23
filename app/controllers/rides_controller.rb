class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end

  def new
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @message= @ride.take_ride
    redirect_to user_path(@ride.user, message: @message)
  end

  def show
    @ride = Ride.find_by(id: params[:id])
  end

  def update
    @ride = Ride.find_by(id:params[:id])
    if @ride.update(params[:ride_[params]])
      redirect_to @user
    else
      render :edit
    end
  end



end
