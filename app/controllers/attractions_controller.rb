class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    session[:attraction_id] = @attraction.id
    if @attraction.save
        @attraction.save
        redirect_to @attraction
    else
      redirect_to new_attraction_path
    end
  end

  def show
    @attraction = Attraction.find(params[:id])
    #session[:attraction_id] = @attraction.id
  end

  private

  def user_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
