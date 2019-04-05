class RidesController < ApplicationController

  # def new
  #   ride = Ride.new(user_id: current_user)
  # end

  def create

    ride = Ride.create(ride_params)
    #@user = User.find(params[:id])

    @message = ride.take_ride
    #flash[:notice] = @message
    render :'users/#{ride.user_id}'

  end

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
