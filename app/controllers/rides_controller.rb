class RidesController < ApplicationController
  def new

  end

  def create
    @ride = Ride.create(user_id: params[:user], attraction_id: params[:attraction])

    if @ride.take_ride.is_a? String
      flash[:notice] = @ride.take_ride
      redirect_to user_path(@ride.user)
    else
    flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
    redirect_to user_path(@ride.user)
    end
  end

end
