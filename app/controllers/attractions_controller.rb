class AttractionsController < ApplicationController
    
    def index
        @attractions = Attraction.all
    end
    
    def new
        @attraction = Attraction.new
    end
    
    def show
        @attraction = Attraction.find_by(id: params[:id])
        @ride = @attraction.rides.build(user_id: current_user.id)
    end
    
    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
           redirect_to new_attraction_path 
        end
    end
    
    private 
    
    def attraction_params
       params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height) 
    end
end
