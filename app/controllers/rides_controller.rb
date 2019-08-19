class RidesController < ApplicationController

  def create
    @attraction = Attraction.find_by(id: params[:attraction_id])
    @ride = current_user.rides.create(attraction: @attraction)
    flash[:message] = @ride.take_ride
    redirect_to user_path(@ride.user, :message => @message)
  end



end
