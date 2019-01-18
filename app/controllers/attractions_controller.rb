class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    #byebug
    @attraction = Attraction.find_by(id: params[:id])
  end
end
