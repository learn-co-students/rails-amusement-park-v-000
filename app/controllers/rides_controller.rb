require 'pry'
class RidesController < ApplicationController

    def create
        @user = User.find(params[:id])
        # error check : user should match logged in user
        ride = Ride.new(:user_id => @user.id, :attraction_id => params[:attraction_id])
        errors = ride.take_ride
        redirect_to user_path(@user)
    end
end
