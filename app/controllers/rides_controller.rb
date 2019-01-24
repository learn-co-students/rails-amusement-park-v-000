class RidesController < ApplicationController
  def create
    @ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])

    if @ride.save

      
      @ride.take_ride

      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"

      redirect_to user_path(@ride.user)
    end
  end
end
