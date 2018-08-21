class AttractionsController < ApplicationController

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)

    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)

    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  def index
    @user = User.find(session[:user_id])
    @attractions = Attraction.all
  end

  def show
    user = User.find_by(id: session[:user_id])
    @attraction = Attraction.find(params[:id])
  end

  def ride
    user = User.find_by(id: session[:user_id])
    attraction = Attraction.find(params[:id])
    ride = Ride.create(user: user, attraction: attraction)
    flash[:notice] = ride.take_ride
    redirect_to user_path(user)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end
end
