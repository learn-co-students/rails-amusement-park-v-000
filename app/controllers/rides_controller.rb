require 'rack-flash'

class RidesController < ApplicationController
use Rack::Flash

  def new
  end

  def create
    @ride = Ride.create(ride_params)
    @ride.take_ride
    flash[:message] = @ride.flash_notice
    redirect_to user_path(@ride.user_id)
  end

  def show
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
