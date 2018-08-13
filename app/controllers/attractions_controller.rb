class AttractionsController < ApplicationController

  def index
    @attraction = Attraction.find(params[:id])
  end




end
