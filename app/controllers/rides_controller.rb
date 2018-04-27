class RidesController < ApplicationController
   
     def new
     @ride = Ride.create(ride_params)
     @ride.user = user
    message = @ride.take_ride
    redirect_to user_path(ride.user)
end
private

# def set_ride
#     @ride = Ride.find(params[:id])
# end

def ride_params
# params.require(:user).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
params.require(:ride).permit(:user_id, :attraction_id)
end
end
