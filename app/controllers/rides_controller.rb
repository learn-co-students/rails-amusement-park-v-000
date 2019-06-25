class RidesController < ApplicationController


  def index
    @rides = Ride.all
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.create(ride_params)
    @ride.user_id = current_user.id
    @ride.name = @ride.attraction.name
    @ride.save
    status = @ride.take_ride
    flash[:notice] = "#{status}"
    redirect_to @ride.user
  end


  private

  def ride_params
    params.require(:ride).permit(:name, :attraction_id, :user_id)
  end
end
