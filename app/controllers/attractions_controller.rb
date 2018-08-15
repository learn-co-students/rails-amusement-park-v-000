class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
    @attraction = Attraction.find_by(id: params[:id])
    @user = current_user

  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end


end
