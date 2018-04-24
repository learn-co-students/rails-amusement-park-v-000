class AttractionsController < ApplicationController
  before_action :find_attraction, only: [:edit, :update, :show]

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
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
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @ride = @attraction.rides.build(user_id: current_user.id)
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def find_attraction
    @attraction = Attraction.find(params[:id])
  end
end
