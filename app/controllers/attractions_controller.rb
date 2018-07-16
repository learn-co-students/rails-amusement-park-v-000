class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]
  
  def new
    @attraction = Attraction.new
  end

  def create
    if current_user.admin
      @attraction = Attraction.create(attraction_params)
      redirect_to attraction_path(@attraction)
    end
  end

  def index
    @attractions = Attraction.all
  end

  def update
    if current_user.admin
      @attraction.update(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      current_user.rides << Ride.new(user_id: current_user.id, attraction_id: @attraction.id)
      flash.notice = current_user.rides.last.take_ride
      redirect_to user_path(current_user)
    end
  end

private

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(
      :name, 
      :min_height, 
      :happiness_rating, 
      :nausea_rating, 
      :tickets
    )
  end
end