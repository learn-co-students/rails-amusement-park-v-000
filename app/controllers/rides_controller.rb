require 'pry'
class RidesController < ApplicationController

    def create
        # error check : user should match logged in user
        ride = Ride.create(:user_id => params[:id], :attraction_id => params[:attraction_id])
        flash[:notice] = ride.take_ride
        redirect_to user_path(ride.user)
    end
end
