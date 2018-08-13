class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all

  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def destroy
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.destroy
    redirect_to attractions_path
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :tickets)
  end

end
