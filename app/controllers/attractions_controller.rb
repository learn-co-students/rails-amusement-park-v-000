class AttractionsController < ApplicationController


    def index
      @attractions = Attraction.all
    end

    def new
      @attraction = Attraction.new
      render :new
    end

    def create
      @attraction = Attraction.new(attraction_params)
      @attraction.save
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])

    end

    def destroy
      @attraction = Attraction.find_by(id: params[:id])
      @attraction.destroy
    end

    private
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end




end
