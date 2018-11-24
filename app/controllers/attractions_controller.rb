class AttractionsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def ride
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
    ride = Ride.new
    ride.attraction = @attraction
    ride.user = @user
    ride.save
    complete_ride = ride.take_ride
    if complete_ride.is_a?(String)
      flash[:notice] = complete_ride
      redirect_to user_path(@user)
    else
      flash[:notice] = "Thanks for riding the #{@attraction.name}!"
      redirect_to user_path(@user)
    end
  end

  def new
  end

  def create
    attraction = Attraction.new(attraction_params)
    if attraction && attraction.save
      redirect_to attraction_path(attraction)
    else
      redirect_to new_attraction_path
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    attraction = Attraction.find(params[:id])
    attraction.update(attraction_params)
    redirect_to attraction_path(attraction)
  end


  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
