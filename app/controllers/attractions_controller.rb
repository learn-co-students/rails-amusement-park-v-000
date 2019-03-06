class AttractionsController < ApplicationController
  def home_page
  end

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def rides
    # raise params.inspect
    user = User.find(params[:ride][:user_id])
    attraction = Attraction.find(params[:ride][:attraction_id])
    ride = Ride.create(user: user, attraction: attraction)

    redirect_to user
    flash[:message] = ride.take_ride
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to @attraction
  end

  def edit
    # raise params.inspect
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to @attraction
  end

  private
    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end
end