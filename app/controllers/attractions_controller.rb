class AttractionsController < ApplicationController
  def index
    require_logged_in
    @attractions = Attraction.all
  end

  def show
    require_logged_in
    @attraction = Attraction.find(params[:id])
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

  private

  def attraction_params
		params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
	end
end
