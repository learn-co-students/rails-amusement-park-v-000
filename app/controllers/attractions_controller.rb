class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
  end
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to @attraction
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find_by(params[:id])
    @attraction.update(attraction_params)
    redirect_to @attraction
  end

private

  def attraction_params
    params.require(:attraction).permit(
      :name,
      :happiness_rating,
      :nausea_rating,
      :tickets,
      :min_height)
  end

end
