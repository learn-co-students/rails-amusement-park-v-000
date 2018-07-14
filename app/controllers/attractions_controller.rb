class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    if current_user && current_user.admin == true
      @attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(@attraction)
    end
  end

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = current_user
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
   @attraction = Attraction.find(params[:id])
   @user = User.find_by(id: session[:user_id])
    if !current_user.admin
      ride = Ride.new(user_id: @user.id, attraction_id: @attraction.id)
      @user.rides << ride
      ride.take_ride
      redirect_to user_path(@user)
    else
      @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    end
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
