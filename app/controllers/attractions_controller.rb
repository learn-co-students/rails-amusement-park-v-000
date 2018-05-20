class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
    @ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:attraction][:attraction_id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end


end
