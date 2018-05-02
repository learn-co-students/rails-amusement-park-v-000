class AttractionsController < ApplicationController
  before_action :find_attraction, only: [:show, :edit, :update]
  def index
    @attractions = Attraction.all
  end

  def show
    @ride = @attraction.rides.build(user_id: current_user.id)
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to @attraction
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attractions_path
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def find_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

end