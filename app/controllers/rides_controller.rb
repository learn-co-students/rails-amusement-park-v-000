class RidesController < ApplicationController

  # def new
  #   ride = Ride.new(user_id: current_user)
  # end

  def create

    ride = Ride.new(user_id: current_user)
    #@user = User.find(params[:id])

    @message = ride.take_ride
    #flash[:notice] = @message 
    render :'users/#{ride.user_id}'

  end

end
