class AttractionsController < ApplicationController
  include UsersHelper

  def new
    @attraction = Attraction.new
  end

  def create
    if logged_in? && current_user.admin
      @attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
