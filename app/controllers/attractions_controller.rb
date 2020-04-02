class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    if current_user.admin
      @attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      redirect_to user_path(current_user)
      flash[:notice] = "You have to be an ADMIN to create a new attraction!"
    end
  end


  def show
    @attraction = Attraction.find(params[:id])
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
