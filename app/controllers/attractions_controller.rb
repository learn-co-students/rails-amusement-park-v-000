class AttractionsController < ApplicationController
  
  def index 
    @attractions = Attraction.all 
  end

  def new

  end

  def create

  end
end
