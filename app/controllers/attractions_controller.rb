class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    current_user
    @attraction = Attraction.find(params[:id])
  end
end
