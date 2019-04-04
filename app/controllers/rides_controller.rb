class RidesController < ApplicationController

  # def new
  #   ride = Ride.new(user_id: current_user)
  # end

  def create
    binding.pry
    ride = Ride.new(user_id: current_user)
    @user = User.find(params[:id])

    @user.take_ride

    render :'users/#{@user.id}'

  end

end
