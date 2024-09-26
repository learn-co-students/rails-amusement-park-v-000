class RidesController < ApplicationController
  
  def ride
    ride = Ride.new(ride_params)
    ride.user = current_user
    if ride.good_ride?
      ride.save
      ride.take_ride
      flash[:notice] = "Thanks for riding the #{ride.attraction.name}!"
      redirect_to ride.user
    else
      flash[:alert] = ride.take_ride
      redirect_to ride.user
    end
  end
  
  private 
    def ride_params
      params.permit(:attraction_id)
    end
    

end
