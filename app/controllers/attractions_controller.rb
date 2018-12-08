class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to @attraction
    else
      render new_attraction_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def show
    current_user
    @attraction = Attraction.find_by(id: params[:id])
  end

  def index
    @attractions = Attraction.all
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to @attraction
    else
      render edit_attraction_path
    end
  end

  private
     def attraction_params
       params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)
     end
end
