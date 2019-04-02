class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end

    def show
       
        @attraction = Attraction.find_by_id(params[:id])
        #binding.pry
        @ride = Ride.new(:attraction_id => @attraction.id)
    end


    
    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update(params[:tickets])
        #ride = Ride.update(user_id: params[:id], attraction_id:params[:attraction_id])
        redirect_to attraction_path(@attraction)
    end
end
