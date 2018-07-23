class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    #binding.pry
    @attraction = Attraction.new(attractions_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def edit
    #binding.pry
    @attraction = Attraction.find(params[:id])
  end

  def update
    #binding.pry
    @attraction = Attraction.find(params[:id])
    @attraction.update(attractions_params)
    redirect_to attraction_path(@attraction)
  end

  def index
    #binding.pry
    @attractions = Attraction.all
    @user = User.find(session[:user_id])
  end

  def show
    #binding.pry
    @attraction = Attraction.find_by(id: params[:id])
    @user = User.find(session[:user_id])
    @ride = Ride.new
    @ride.attraction = @attraction
  end

  private

  def attractions_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating)
  end

end
