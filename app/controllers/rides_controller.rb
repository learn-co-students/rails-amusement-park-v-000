class RidesController < ApplicationController

  def create
    @ride = Ride.new(attraction_id: params[:id], user_id: session[:user_id])
    if @ride.save
      flash[:message] = @ride.take_ride
      redirect_to user_path(@ride.user)
    else
      redirect_to attractions_path
    end
  end

end
