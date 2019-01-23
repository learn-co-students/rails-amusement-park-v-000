class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = User.find_by_id(session[:user_id])
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = User.find_by_id(session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :happiness_rating, :min_height, :nausea_rating, :tickets)
  end
end
