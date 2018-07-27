class AttractionsController < ApplicationController 
    def index 
        @attractions = Attraction.all
        @user = User.find(session[:user_id])
    end

    def show 
        @attraction = Attraction.find(params[:id])
        @user = User.find(session[:user_id])
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

    def new 
        @attraction = Attraction.new
    end 

    def create 
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def edit 
        find
    end

    def update 
        find
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :tickets, :nausea_rating, :happiness_rating)
    end

    def find 
        @attraction = Attraction.find(params[:id])
    end
end