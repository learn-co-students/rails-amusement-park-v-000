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
    @attraction = Attraction.create(attraction_params)
    return redirect_to '/attractions/new' unless @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    return edit_attraction_path(@attraction) unless @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def take_ride
    @attraction = Attraction.find(params[:id])
    ride = Ride.create(user_id: session[:user_id], attraction_id: @attraction.id)
    flash[:alert] = "#{ride.take_ride}"
    flash[:notice] = "Thanks for riding the #{@attraction.name}!"
    redirect_to '/'
  end

  private
  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
