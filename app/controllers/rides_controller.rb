class RidesController < ApplicationController
<<<<<<< HEAD
  before_action :authenticatation_required
  def create
    ride = Ride.create(ride_params)
    message = ride.take_ride
    redirect_to user_path(ride.user), flash: {message: message}
=======
  def create
    ride = Ride.create(ride_params)
    message = ride.take_ride
    redirect_to user_path(ride.user), flash: { message:message }
>>>>>>> refs/remotes/origin/master
  end

  private
  def ride_params
<<<<<<< HEAD
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
=======
    params.require(:ride).permit(
      :user_id,
      :attraction_id
      )
  end
end
>>>>>>> refs/remotes/origin/master
