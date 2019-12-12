class AttractionsController < ApplicationController
  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end


  def edit
    @attraction = Attraction.find(params[:id])
  end


  def index
    @user = User.find(current_user.id)
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def show
    @user = User.find(current_user.id)
    @attraction = Attraction.find(params[:id])
    @new_ride = Ride.new
  end

  def update
    @user = User.find(current_user.id)

    if @user.admin
      @attraction = Attraction.find(params[:id])
      @attraction.update(attraction_params)

      redirect_to attraction_path(@attraction)
    end
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end 