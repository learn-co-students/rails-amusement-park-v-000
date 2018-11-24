class AttractionsController < ApplicationController
  before_action :attraction, except: [:new, :create, :index]

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
      redirect_to @attraction, notice: "Attraction was successfully created."
    else
      render :new
    end
  end

  def edit
  end
  def update
    if @attraction.update(attraction_params)
      redirect_to @attraction, notice: "Attraction was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy
    redirect_to attractions_url, notice: "Attraction was successfully destroyed."
  end

  private

  def attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :min_height, :happiness_rating, :nausea_rating)
  end
end
