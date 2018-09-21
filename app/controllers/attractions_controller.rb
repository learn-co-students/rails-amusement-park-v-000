class AttractionsController < ApplicationController
    include UsersHelper

    def index
        @attractions = Attraction.all
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.find_or_create_by(strong_params(params))
        redirect_to attraction_path(@attraction)
    end


    def show
        @attraction = Attraction.find_by(:id => params[:id])
        @ride = Ride.new
    end

    def edit
        @attraction = Attraction.find_by(:id => params[:id])
    end


    def update
        @attraction = Attraction.find_by(:id => params[:id])
        @attraction.update(strong_params(params))
        redirect_to attraction_path(@attraction)
    end

    private

    def strong_params(params)
        params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end


end
