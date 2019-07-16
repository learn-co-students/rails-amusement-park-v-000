class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end 
  
  def show
    @attraction = Attraction.find_by(id: params[:id])
    @ride = Ride.new
    @user = User.find(session[:user_id]) #- in ride controller
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit( 
      :name,
      :min_height,
      :tickets,
      :happiness_rating,
      :nausea_rating
    )
  end

  end