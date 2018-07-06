class RidesController < ApplicationController
  def create
    @ride = Ride.create(ride_params)
    @go = @ride.take_ride
    if @go.class == String
      redirect_to user_path(@ride.user), notice: "#{@go}"
    elsif @go.class == TrueClass
      redirect_to user_path(@ride.user), notice: "Thanks for riding the #{@ride.attraction.name}!"
    end
  end

  private
  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
