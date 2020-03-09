class AttractionsController < ApplicationController

    def index
        if session[:user_id]
            @user = User.find(session[:user_id])
            @attractions = Attraction.all
        else 
            redirect_to '/' 
        end 
    end

    def show
        if session[:user_id]
            @user = User.find(session[:user_id])
            @attraction = Attraction.find(params[:id])
        else 
            redirect_to '/' 
        end 
    end

    def edit

    end

    def update
        user = User.find(session[:user_id])
        ride = user.rides.build
        ride.take_ride
        ride.save
        redirect_to user_path(user)
    end

end 