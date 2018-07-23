class AttractionsController < ApplicationController
before_action :set_attraction, only: [:show, :edit, :update]


    def index
        @attractions = Attraction.all
    end

    def show
    end

    def new
      @attraction = Attraction.new
    end


    def edit
    end

    def update
      @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    end

    def create
      @attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(@attraction)
    end

    private

    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :nausea_rating, :happness_rating, :tickets, :min_height)
    end

end
