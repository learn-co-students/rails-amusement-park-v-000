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
    @attraction = Attraction.find_by(params[:id])
  end

  def create
    @attraction = Attraction.create(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      redirect_to new_attraction_path
    end
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      redirect_to attractions_path
    end
  end


  def destroy
  end



  private

  def attraction_params
      params.require(:attraction).permit(
        :name,
        :min_height,
        :tickets,
        :happiness_rating,
        :nausea_rating
      )
  end

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end
end
