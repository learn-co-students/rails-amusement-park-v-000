class AttractionsController < ApplicationController

   def index
     @attractions = Attraction.all
   end

   def show
     @attraction = Attraction.find(params)
   end


end
