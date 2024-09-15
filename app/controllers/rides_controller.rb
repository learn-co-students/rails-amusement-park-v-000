class RidesController < ApplicationController
  def create
    @ride = Ride.new(ride_params)
    ride_result = @ride.take_ride

    if ride_result.empty? && @ride.save
      flash[:notice] = "Thanks for riding the #{Attraction.find(params[:ride][:attraction_id]).name}!"
      redirect_to user_path(User.find(params[:ride][:user_id]))
    else
      flash[:notice] = ride_result
      redirect_to user_path(User.find(params[:ride][:user_id]))
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
