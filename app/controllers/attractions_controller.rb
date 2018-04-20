class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

#can put this in a ride controller as ride create ....
  def ride
    ride = Ride.create(user_id: current_user.id, attraction_id: params[:id])
    ride_message = ride.take_ride
    redirect_to ride.user, alert: ride_message
  end
end
