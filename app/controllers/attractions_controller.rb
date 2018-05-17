class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = User.find(current_user)
  end

  def new

  end

  def create
    #what if there is already an attraction with that name?
    @attraction = Attraction.create(attraction_params)
    redirect_to @attraction
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(current_user)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end


end
