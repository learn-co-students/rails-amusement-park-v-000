class RidesController < ApplicationController

  # def new
  #   ride = Ride.new(user_id: current_user)
  # end

  def create

    ride = Ride.new(user_id: current_user)
    #@user = User.find(params[:id])

    ride.take_ride
    binding.pry 
    render :'users/#{ride.user_id}'

  end

end
