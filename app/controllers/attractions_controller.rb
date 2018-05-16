class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    byebug
    @attraction = Attraction.find(params[:id])
  end


end
