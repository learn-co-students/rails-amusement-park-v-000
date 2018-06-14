class RidesController < ApplicationController
  def new

  end

  def create
    binding.pry
    attraction = Attraction.find_by(id: params[:id])
    ride = Ride.new(ride_params)
    if !ride.too_short? & !ride.too_broke?
      ride.take_ride
      redirect_to user_path(current_user)
    else
      flash[:message] = ride
    end


  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
