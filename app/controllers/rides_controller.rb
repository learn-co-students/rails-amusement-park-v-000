class RidesController < ApplicationController

    def new
    end 

    def create 
        @attraction = Attraction.find(params[:attraction_id])
        @user = User.find(session[:user_id])
        @ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)

       message = @ride.take_ride

       flash[:notice] = message 

       redirect_to user_path(@user)

    end 
    
end
