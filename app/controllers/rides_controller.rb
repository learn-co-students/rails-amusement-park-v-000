class RidesController < ApplicationController
  def create
    @ride = Ride.create(ride_params)
    redirect_to user_path(@ride.user)
  end

  def update
    if @ride.update(ride_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  private
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
