class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all

  end

  def show
    @attraction = Attraction.find(params[:id])
    @ride = Ride.new
    # @ride.user.build

    # @ride.take_ride
    # @ride.current_user
    # @ride.save
  end
end
