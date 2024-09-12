require 'pry'
class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all 

    end

    def show 
        @attraction = Attraction.find(params[:id])    
    end

    def new
        @attraction = Attraction.new
    end

    def create 
        @attraction = Attraction.create(attraction_params)
        redirect_to @attraction
    end

    def edit 
        @attraction = Attraction.find(params[:id])
    end

    def update 
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        redirect_to @attraction
    end

    private 

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end