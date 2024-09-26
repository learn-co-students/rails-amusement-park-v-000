class RidesController < ApplicationController

  def show
    @ride = Ride.find_by(params[:id])
  end

  def create
    @ride = Ride.create(ride_params)
    flash[:message] = @ride.take_ride
    redirect_to user_path(@ride.user)
  end

  private

    def ride_params
      params.require(:ride).permit(:attraction_id, :user_id)
    end
end
