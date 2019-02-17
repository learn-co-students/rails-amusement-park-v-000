class RidesController < ApplicationController



  def create
    @user = User.find_by(id: session[:user_id])
    @ride = Ride.create(attraction_id: params[:attraction_id], user_id: @user.id )
    flash[:success] = @ride.take_ride

    redirect_to user_path(@user)
  end
  end
