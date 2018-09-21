class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @user = current_user
  end

  def edit
    @attraction = Attraction.find_by(id:params[:id])
    @user = current_user
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
  
end
