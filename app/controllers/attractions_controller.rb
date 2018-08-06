class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    else
      flash[:alert] = @attraction.errors.full_messages[0]
      redirect_to @attraction
    end
  end

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @attraction = Attraction.find_by_id(params[:id])
    @user = current_user
    @ride = Ride.new
  end

  def edit
    @attraction = Attraction.find(params[:id])

  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to @attraction
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating)
    end
end
