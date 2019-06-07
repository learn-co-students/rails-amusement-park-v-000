class RidesController < ApplicationController

  def create
    @ride = Ride.create(ride_params)

    if @ride.user.tickets < @ride.attraction.tickets && @ride.user.height < @ride.attraction.min_height
      flash[:error] = "Sorry. You do not have enough tickets to ride the #{@ride.attraction.name}. You are not tall enough to ride the #{@ride.attraction.name}."
    elsif @ride.user.tickets < @ride.attraction.tickets
      flash[:error] = "Sorry. You do not have enough tickets to ride the #{@ride.attraction.name}."
    elsif @ride.user.height < @ride.attraction.min_height
      flash[:error] = "Sorry. You are not tall enough to ride the #{@ride.attraction.name}."
    else
      @ride.take_ride
      flash[:message] = "Thanks for riding the #{@ride.attraction.name}!"
    end

    redirect_to user_path(@ride.user)
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
