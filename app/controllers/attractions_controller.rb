class AttractionsController < ApplicationController
    def index 
        @attractions = Attraction.all
        @attraction = Attraction.new
    end

    def show
        @attraction = Attraction.find(params[:id])
        @ride = Ride.new
    end

    def new
        @attraction = Attraction.new
    end

    def create 
        @attraction = Attraction.create(attraction_params)
            if @attraction.save
                redirect_to attraction_path(@attraction)
            else 
                render :new
            end
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])
        if @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        else
            render :edit
        end
    end


    private

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
    end
end
