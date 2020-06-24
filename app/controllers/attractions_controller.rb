class AttractionsController < ApplicationController

    def index 
        @attractions = Attraction.all 
        @user = User.find(session[:user_id])
    end

    def show 
        @attraction = Attraction.find(params[:id])
    end

    def new 
        @attraction = Attraction.new
    end

    def create 
        @attraction = Attraction.new(attraction_params)
        @attraction.save
        redirect_to attraction_path(@attraction)
    end

    def edit 
        @attraction = Attraction.find(params[:id])
    end

    def update 
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def attraction_params
        params.require(:attraction).permit(:name, :password, :nausea_rating, :happiness_rating, :tickets, :min_height)
    end
end
