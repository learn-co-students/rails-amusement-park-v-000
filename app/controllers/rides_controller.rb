class RidesController < ApplicationController
  before_action :require_login

  def create

    @ride = Ride.create(ride_params)

    if @ride.take_ride.class == String
      flash[:notice] = @ride.take_ride
    else
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
    end
    redirect_to user_path(@ride.user)
  end

  private

  def ride_params
       params.permit(:user_id, :attraction_id)
  end

end
