class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
        @attraction = Attraction.new
        @current_user = current_user
    end

    def new
        if current_user.admin
            @attraction = Attraction.new
        else
            redirect_to attractions_path
        end
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end
    
    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.update(params[:id], attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def show
        @attraction = Attraction.find(params[:id])
    end

    private

    def attraction_params
        params.require(:attraction).permit(
          :name,
          :min_height,
          :tickets,
          :happiness_rating,
          :nausea_rating
        )
      end

end