class RidesController < ApplicationController
  def new
    @ride = Ride.new(ride_params)
    @user = User.find_by(id: params[:ride][:user_id])
    @attraction = Attraction.find_by(id: params[:ride][:attraction_id])
    if @ride.save
      @message = @ride.take_ride
      redirect_to user_path(@ride.user, :message => @message)
    else
      redirect_to attractions_path(@ride.attraction)
    end
  end

  private
  def ride_params
    params.require(:ride).permit(:user_id,  :attraction_id)
  end
end
