class RidesController < ApplicationController


  def create
    ride = Ride.create(ride_params)
    notice = ride.take_ride
    #binding.pry
    flash[:notice] = notice
    redirect_to user_path(ride.user)
  end

 private

 def ride_params
   params.require(:ride).permit(:user_id, :attraction_id)
 end
end