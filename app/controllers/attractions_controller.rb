class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @a = Attraction.find(params[:id])
  end

  def update
    @a = Attraction.find(params[:id])
    ride = Ride.create(user: current_user, attraction: @a)
    flash[:message] = ride.take_ride

    redirect_to user_path(current_user)

  end
end
