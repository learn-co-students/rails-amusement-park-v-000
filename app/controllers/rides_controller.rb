class RidesController < ApplicationController

  def new
  end

  def create
    @attraction = Attraction.find_by(params[:attraction_id])
    @ride = Ride.create(ride_params)
    flash[:message] = @ride.take_ride
    redirect_to user_path(current_user)
  end

  private

    def ride_params
      params.require(:ride).permit(:user_id, :attraction_id)
    end
end
