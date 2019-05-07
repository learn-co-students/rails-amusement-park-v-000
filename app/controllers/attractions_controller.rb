class AttractionsController < ApplicationController

    def index 
        @attractions = Attraction.all 
    end 

    def new 
    end 

    def create 
    end 

    def show 
    end 

    def edit 
    end 

    def update
    end 

    private 
    def attraction_params
        params.require(:attractions).permit(:name, :tickets, :min_height, :happiness_rating, :nausea_rating)
    end 
    end 