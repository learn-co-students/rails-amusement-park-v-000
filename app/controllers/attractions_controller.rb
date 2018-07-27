class AttractionsController < ApplicationController 
    def index 
        @attractions = Attraction.all
    end

    def show 
        @attraction = Attraction.find(params[:id])
    end

    def take_ride 
        # binding.pry
        @user = User.find(session[:user_id])
        @attraction = Attraction.find_by(name: params[:attraction])
        @ride = Ride.create(user: @user, attraction: @attraction)
        flash[:message] = @ride.take_ride
        # binding.pry
        redirect_to user_path(@user)
    end
end