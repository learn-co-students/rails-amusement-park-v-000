class AttractionsController < ApplicationController

   def index
     @attractions = Attraction.all
   end

   def show
     @attraction = Attraction.find(params[:id])
     @ride = Ride.new
   end

   def new
     @attraction = Attraction.new
   end

   def create
     @attraction = Attraction.create(attraction_params(:name, :min_height, :happiness_rating, :nausea_rating, :tickets))
     redirect_to attraction_path(@attraction)
   end

   def edit
     @attraction = Attraction.find(params[:id])
   end

   def update
     @attraction = Attraction.find(params[:id])
     @attraction.update(attraction_params(:name, :min_height, :happiness_rating, :nausea_rating, :tickets))
     redirect_to attraction_path(@attraction)
   end


   private

   def attraction_params(*args)
     params.require(:attraction).permit(*args)
   end

end
