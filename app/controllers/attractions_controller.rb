class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
    # @ride.user.build

    # @ride.take_ride
    # @ride.current_user
    # @ride.save
  end
###
def edit
  @attraction = Attraction.find(params[:id]) #define intstance variable for view
end

def update
  @attraction = Attraction.find(params[:id]) #define intstance variable for view
  if @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  else
    render :edit
  end
end

###

  private
  def attraction_params
   params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end
end
