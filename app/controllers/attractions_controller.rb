class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @attract = Attraction.find(params[:id])
    @user = current_user
  end

  def update
    @attract = Attraction.find(params[:id])
    @attract.update(attraction_params)

    redirect_to @attract
  end

  def new
    @attract = Attraction.new
  end

  def create
    @attract = Attraction.create(attraction_params)

    redirect_to attraction_path(@attract)
  end

  def edit
    @attract = Attraction.find(params[:id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
  end
end
