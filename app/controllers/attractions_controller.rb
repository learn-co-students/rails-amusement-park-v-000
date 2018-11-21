class AttractionsController < ApplicationController
  include SessionsHelper

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
    @ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
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
    @attraction = Attraction.find(params[:id])
    if current_user.admin && logged_in?
      @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :index
    end
  end


  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
  end


end
