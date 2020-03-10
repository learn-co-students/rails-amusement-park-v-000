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

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        @attraction.save
        redirect_to attraction_path(@attraction.id)
    end

    def take_ride
        attraction = Attraction.find(params[:id])
        user = User.find(session[:user_id])
        ride = Ride.new(attraction_id: attraction.id, user_id: user.id )
        message = ride.take_ride
        ride.save
        flash[:message] = message
        redirect_to user_path(user)
    end

    def update
        attraction = Attraction.find(params[:id])
        attraction.update(attraction_params)
        attraction.save
        redirect_to attraction_path(attraction)
    end 

    def edit
        @attraction = Attraction.find(params[:id])
    end


    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :tickets, :happiness_rating)
    end 

end 