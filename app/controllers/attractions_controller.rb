require 'pry'
class AttractionsController < ApplicationController

    def index
        redirect_to '/' if !logged_in?
        @attractions = Attraction.all
    end

    def show
        redirect_to '/' if !logged_in?
        @attraction = Attraction.find(params[:id])
        @user = current_user
    end

    def new
        @attraction = Attraction.new
    end

    def create
        redirect_to '/' if !logged_in?    
        @attraction = Attraction.new(attraction_params)   
        if !@attraction.save
            redirect_to new_attraction_path 
        end      
        redirect_to @attraction
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end