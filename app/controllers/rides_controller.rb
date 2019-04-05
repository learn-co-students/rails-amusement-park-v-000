class RidesController < ApplicationController

  # def new
  #   ride = Ride.new(user_id: current_user)
  # end

  def create

    @ride = Ride.create(ride_params)

    if @ride.save
      @message = @ride.take_ride  
      flash[:notice] = @message
      redirect_to user_path(@ride.user, message: @message)

    end

  end

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
