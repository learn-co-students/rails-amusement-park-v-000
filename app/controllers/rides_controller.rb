class RidesController < ApplicationController

  def create
    binding.pry
    @ride = Ride.create(:user_id => params[:user_id], :attraction_id => params[:attraction_id])
  end
end
