class RidesController < ApplicationController

    def new
    end

    def create
        @user = User.find(session[:user_id])
        @ride = Ride.create(
            :user_id => params[:user_id],
            :attraction_id => params[:attraction_id]
          )
        @ride.take_ride
        redirect_to user_path(@user)
    end



end