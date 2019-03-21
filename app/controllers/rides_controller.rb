class RidesController < ApplicationController

  def index
    @rides = Ride.all
  end

  def new
    @ride = Ride.create(params[:ride])
  #  @ride = @ride.take_ride
    redirect_to user_path(@ride)
  end


#  def show
#    @ride = Ride.find_by(id: params[:id])
#  end

end
