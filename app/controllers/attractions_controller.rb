class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
 end

 def new
   @attraction = Attraction.new
 end

 def create
   @attraction = Attraction.create(attraction_params)
   redirect_to attraction_path(@attraction)
 end

 def edit
   @attraction = Attraction.find(params[:id])
 end

 def update
   @attraction = Attraction.find(params[:id])
   @attraction.update(attraction_params)
   redirect_to attraction_path(@attraction)
 end

 def show
   @attraction = Attraction.find(params[:id])
 end

 private
 def attraction_params
   params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
 end

end
