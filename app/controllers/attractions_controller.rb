class AttractionsController < ApplicationController
  before_action :set_user

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def new
    @user = current_user
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    @attraction.update(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def destroy

  end

  private

  def attraction_params
    params.require(:attraction).permit(:name,:tickets,:happiness_rating, :nausea_rating, :min_height)
  end

  def set_user
    @user = current_user
  end
end