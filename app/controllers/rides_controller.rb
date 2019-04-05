class RidesController < ApplicationController

  # def new
  #   ride = Ride.new(user_id: current_user)
  # end

  def create

    @ride = Ride.new(ride_params)

    if @ride.save
      @message = @ride.take_ride
      redirect_to user_path(@ride.user, flash[:notice] = @message)
    #flash[:notice] = @message
    end

  end

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
