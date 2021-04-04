class RidesController < ApplicationController
  before_action :authentication_required

 def create
   ride = Ride.new(ride_params)

   if ride.take_ride_ok?
       ride.save
       message = ride.update_user
       redirect_to user_path(ride.user), flash: { message: message }
   else
       message = ride.not_take_ride
       redirect_to user_path(ride.user), flash: { message: message }
   end

 end

 private

  def ride_params
    params.require(:ride).permit(
    :user_id,
    :attraction_id
    )
  end

end
