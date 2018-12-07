class AttractionsController < ApplicationController
  def new
  end

  def show
    current_user
    @attraction = Attraction.find_by(id: params[:id])
  end

  def index
    @attractions = Attraction.all
  end

  def update
  end
end
