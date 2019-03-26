class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
    # @ride = @attraction.rides.build(user_id: current_user.id)
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def edit
    @attraction = Attraction.find_by(id: params[:id])
    # @ride = @attraction.rides.build(user_id: current_user.id)
  end

  def update
    @attraction = Attraction.find_by(id: params[:id])
    if @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
