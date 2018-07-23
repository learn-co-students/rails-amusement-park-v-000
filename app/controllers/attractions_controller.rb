class AttractionsController < ApplicationController
  
    def index
        @attractions = Attraction.all 
    end 

    def show 
        @ride = Ride.new
        @attraction = Attraction.find(params[:id])
    end
    
end
end
