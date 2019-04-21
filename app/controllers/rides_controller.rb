class RidesController < ApplicationController

  def create
    #binding.pry
    @ride = Ride.create(user_id: session[:user_id], attraction_id: params[:attraction_id])
    redirect_to @ride.user
  end

end
