class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :edit, :destroy, :update]

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def edit
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_attraction
    @attraction = Attraction.find_by(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(
      :name,
      :tickets,
      :happiness_rating,
      :nausea_rating
    )
  end
end
