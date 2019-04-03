class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find_by_id(params[:id])
        @ride = Ride.new
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to @attraction, notice: 'Attraction was successfully created.'
        else
            render :new 
        end
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])
        @attraction.update(attraction_params)
        #ride = Ride.update(user_id: params[:id], attraction_id:params[:attraction_id])
        redirect_to attraction_path(@attraction)
    end

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
