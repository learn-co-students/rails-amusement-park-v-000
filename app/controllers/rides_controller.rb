class RidesController < ApplicationController
  def new

  end

  def create
    attraction = Attraction.find_by(id: params[:id])
    ride = Ride.new(ride_params)

    if !ride.too_short?(attraction) & !ride.too_broke?(attraction)
      ride.take_ride(attraction)
      redirect_to user_path(current_user)
    else
      flash[:message] = ride(attraction)
    end


  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
