class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

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
    @attraction = Attraction.create(attraction_params)
    if @attraction.save
      redirect_to @attraction, notice: 'Attraction was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to @attraction, notice: 'Attraction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_path, notice: 'Attraction was successfully destroyed.'
  end


private

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
      params.require(:attraction).permit(
        :name,
        :min_height,
        :tickets,
        :happiness_rating,
        :nausea_rating
      )
    end

end
