class AttractionsController < ApplicationController
  def index
    @atts = Attraction.all
      @user = current_user
  end

  def show
    @att = Attraction.find_by_id(params[:id])
    @user = current_user
    @ride = Ride.new
  end

  def new
    @att = Attraction.new
  end

  def create
    @att = Attraction.create(attraction_params)
    redirect_to attraction_path(@att)
  end

  def edit
    @att = Attraction.find_by_id(params[:id])
  end

  def update
    @att = Attraction.find_by_id(params[:id])
    @att.update(attraction_params)
    redirect_to attraction_path(@att)
  end

  private
  
  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
  end
end
