class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    #binding.pry
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end
end
