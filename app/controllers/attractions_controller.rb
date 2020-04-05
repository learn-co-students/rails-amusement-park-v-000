class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
    end 

    def new
        @attraction = Attraction.new
    end 

    def create
        @attraction = Attraction.new(attractions_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            redirect_to attractions_path
        end 
    end 

    def show
        @attraction = Attraction.find_by(id: params[:id])
    end 

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end 

    def update
        @attraction = Attraction.find_by(id: params[:id])
        if @attraction.update(attractions_params)
            redirect_to attraction_path(@attraction)
        else
            render 'attractions/edit'
        end
    end 

    private

    def attractions_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end 