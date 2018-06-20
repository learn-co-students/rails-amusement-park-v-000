class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :update, :destroy]
    def index
        @attractions = Attraction.all
    end

    def show
        @ride = Ride.new
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def edit
    end

    def update
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def set_attraction
        @attraction = Attraction.find(params[:id])
    end

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end