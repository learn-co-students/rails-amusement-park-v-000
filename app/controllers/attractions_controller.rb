class AttractionsController < ApplicationController

  def new
  end

  def create
    attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(attraction)
  end
  def index
    @user = User.find(session[:user_id])

  end

  def show
    @user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
  end

  def ride
    attraction = Attraction.find(params[:id])
    user = User.find(session[:user_id])
    ride = Ride.create(attraction_id: attraction.id, user_id: user.id)

    session[:message] = ride.take_ride
    redirect_to user_path(user)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name,:happiness_rating,:nausea_rating,:tickets,:min_height)
  end
end
