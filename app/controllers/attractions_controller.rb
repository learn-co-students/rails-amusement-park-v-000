class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @new_attraction = Attraction.new
  end

  def show
    @attraction = Attraction.find_by(id: params[:id])
  end

  def ride
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    flash[:message] = @ride.take_ride
    redirect_to user_path(@ride.user)
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    return head(:forbidden) unless current_user.admin
    @attraction = Attraction.find_by(id: params[:id])
  end

  private

  def attraction_params
    params.require(:attraction)
  end

end
