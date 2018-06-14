class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @a = Attraction.find(params[:id])
    @user = current_user
  end

  def update
    @a = Attraction.find(params[:id])
    @a.update(attraction_params)

    redirect_to @a
  end

  def new
    @a = Attraction.new
  end

  def create
    @a = Attraction.create(attraction_params)

    redirect_to attraction_path(@a)
  end

  def edit
    @a = Attraction.find(params[:id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
  end
end
