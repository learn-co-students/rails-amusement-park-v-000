require 'rack-flash'

class RidesController < ApplicationController

  before_action :require_login

  use Rack::Flash

  def create
    @ride = Ride.new(ride_params)
    @ride.user_id = current_user.id
    @ride.save
    flash[:notice] = @ride.take_ride
    redirect_to user_path(@ride.user)
  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end

end
