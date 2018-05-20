class RidesController < ApplicationController

  def new
  end

  def create

    @ride = Ride.create(ride_params)
    flash[:message]= @ride.take_ride
    #byebug
    redirect_to user_path(@ride.user)
  end

  def update
    #byebug
    #@ride = Ride.create(params[:id])
    #@user = User.finde(@ride.user_id)
    #redirect_to user_path(@user)
  end


  private

    def ride_params
      params.require(:ride).permit(:user_id, :attraction_id)
    end

end
