class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    # byebug
    @attraction = Attraction.find(params[:id])
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    user = User.find(session[:user_id])
    @attraction = Attraction.find(params[:id])
    if user.admin
      @attraction.update(att_params)
      redirect_to attraction_path(@attraction)
    else
      r = Ride.create(user_id: user.id, attraction_id: ride_params[:att_id])
      msg = r.take_ride
      flash[:notice] = "#{msg}"
      redirect_to user_path(user)
    end
  end

  def new
    @attraction = Attraction.new(name: 'name')
  end

  def create
    @attraction = Attraction.create(att_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def ride_params
    params.permit(:att_id)
  end

  def att_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
