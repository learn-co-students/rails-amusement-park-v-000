class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def ride
    ride = Ride.create(user_id: current_user.id, attraction_id: params[:id])
    ride.take_ride
    redirect_to ride.user
  end
end
