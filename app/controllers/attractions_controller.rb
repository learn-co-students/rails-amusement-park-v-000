class AttractionsController < ApplicationController
  before_action :auth_user

  def index
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_url(@attraction)
  end

  def ride
    @ride = Ride.create(attraction_id: params[:attraction_id], user_id: params[:user_id])
    redirect_to user_path(current_user), notice: "#{@ride.take_ride}!"
  end

  private

  def auth_user
    if !logged_in?
      redirect_to root_url
    end
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
