class AttractionsController < ApplicationController

  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
      @attractions = Attraction.all
    else
      redirect_to root_path
    end
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attractions_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attractions_params)
    if @attraction
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end
  end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
      @attraction = Attraction.find(params[:id])
      @ride = Ride.new
    else
      redirect_to root_path
    end
  end

private

  def attractions_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
