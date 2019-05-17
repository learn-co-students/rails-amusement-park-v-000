
class RidesController < ApplicationController
    def new
        user = User.find(session[:user_id])
        attraction = Attraction.find(params[:attraction_id])
        ride = Ride.create(user_id: user.id, attraction_id: attraction.id)
        results = ride.take_ride
        session[:ride_result] = results
        redirect_to user_path(user)
    end
end 