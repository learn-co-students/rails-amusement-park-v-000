require 'pry'
class RidesController < ApplicationController

    def create
        @user = User.find(params[:id])
        @attraction = Attraction.find(params[:attraction_id])
        # error check : user should match logged in user
        ride = Ride.new(:user_id => @user.id, :attraction_id => params[:attraction_id])
        message = ride.take_ride
        flash[:notice] = message
        redirect_to user_path(@user)
    end
end
