class AttractionsController < ApplicationController
  helper_method :current_user
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attractions_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attractions_params)
    redirect_to attraction_path(@attraction)
  end

  private
  def attractions_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end
end
