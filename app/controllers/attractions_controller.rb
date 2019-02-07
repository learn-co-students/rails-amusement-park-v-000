class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    if current_user.admin
      @attraction = Attraction.new(attraction_params)
      @attraction.save
      redirect_to attraction_path(@attraction)
    else
      flash.alert = "You cannot add an attraction unless you are an admin."
      redirect_to attractions_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
  	 @attraction = Attraction.find(params[:id])
  	 @attraction.update(attraction_params)
  	 redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end
