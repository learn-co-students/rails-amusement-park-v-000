class AttractionsController < ApplicationController
   def new
     @attraction = Attraction.new
   end

    def create
     @attraction = Attraction.new(attraction_params)
     @attraction.save
     redirect_to attraction_path(@attraction)
   end

    def edit
     @attraction = Attraction.find_by(params[:id])
   end

    def update
     @attraction = Attraction.find_by(params[:id])
     @attraction.update(attraction_params)
     redirect_to attraction_path(@attraction)
   end

    def index
     @attractions = Attraction.all
   end

    def show
     @attraction = Attraction.find_by(id: params[:id])
     @ride = Ride.new
   end

    private

    def attraction_params
     params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
   end
 end
