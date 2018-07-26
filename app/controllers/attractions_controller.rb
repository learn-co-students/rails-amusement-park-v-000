class AttractionsController < ApplicationController
  include UsersHelper

  def index
    @attractions = Attraction.all
    @user = current_user
  end

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

  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
    @user = current_user
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private
  def attraction_params
    params.require(:attraction).permit(:tickets, :min_height, :happiness_rating, :nausea_rating, :name)
  end
end
