class RidesController < ApplicationController

  def create

    @ride = Ride.create(ride_params(:attraction_id, :user_id))

    if @ride.take_ride.class == String
      flash[:notice] = @ride.take_ride
    else
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
    end
    redirect_to user_path(@ride.user)
  end

  private

  def ride_params(*args)
    params.require(:ride).permit(*args)
  end

end
