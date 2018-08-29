class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @user = current_user
    @ride = Ride.new
  end

  def edit
  end

  def create
    if logged_in? && current_user.admin
      @attraction = Attraction.new(attraction_params)
      redirect_to attraction_path(@attraction), notice: 'Attraction was successfully created.'
    else
      redirect_to attraction_path
    end
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction), notice: 'Attraction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_url, notice: 'Attraction was successfully destroyed.'
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :tickets, :happiness_rating, :nausea_rating)
  end
end
