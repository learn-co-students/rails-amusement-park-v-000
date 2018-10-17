class AttractionsController < ApplicationController
    def new
        @attraction = Attraction.new
    end
    
    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction.id)
    end
    
    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction.id)
    end
    
    def index
        @user = current_user
        @attractions = Attraction.all
    end
    
    def show
        # binding.pry
        @ride = Ride.new
        @user = current_user
        @attraction = Attraction.find(params[:id])
    end
    
    def edit
        @attraction = Attraction.find(params[:id])
    end
    
    private
    
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end