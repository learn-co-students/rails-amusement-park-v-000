class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new(attraction_id: @attraction.id)
  end

  private

  # def user_params
  #   params.require(:user).permit(:name, :admin, :height, :happiness, :nausea, :tickets, :password)
  # end
end
