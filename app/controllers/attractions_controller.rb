class AttractionsController < ApplicationController
    before_action :set_attraction
    skip_before_action :set_attraction, only: [:index, :new, :create]
    def index 
        @attractions = Attraction.all
    end

    def show
        # @attraction = Attraction.find_by(id: params[:id])
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def edit 
        # @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        # @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    private

    def attraction_params
        params.require(:attraction).permit(
            :name,
            :min_height,
            :nausea_rating,
            :tickets,
            :happiness_rating
        )
    end

    def set_attraction
        @attraction = Attraction.find_by(id: params[:id])
    end
end