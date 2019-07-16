class RidesController < ApplicationController

    def new
    end

    def create
        @attraction = Attraction.find(rides_params[:attraction_id])
        @user = User.find(session[:user_id])
        @ride = Ride.create(rides_params)
        flash[:message] = @ride.take_ride
        redirect_to user_path(@user)
    end

    private
    def rides_params
      params.require(:ride).permit(
         :user_id,
         :attraction_id
      )
    end

end