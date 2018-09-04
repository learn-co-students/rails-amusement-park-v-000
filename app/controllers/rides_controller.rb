class RidesController < ActionController::Base

  def create
    @ride = Ride.create(ride_params)
    @message = @ride.take_ride
    @user = @ride.user
    render "/users/show"
  end

  def ride_params
    params.require(:ride).permit(:user_id, :attractions_id)
  end

end
