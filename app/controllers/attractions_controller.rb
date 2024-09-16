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
    @user = User.find_by_id(session[:user_id])
    @attraction = Attraction.new
    if @user.admin == false
      redirect_to @user
    end
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to @attraction
  end

  def edit
    @attraction = Attraction.find_by_id(params[:id])
  end

  def update
    @attraction = Attraction.find_by_id(params[:id])
    @attraction.update(attraction_params)
    redirect_to @attraction
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :nausea_rating, :happiness_rating)
  end

end
