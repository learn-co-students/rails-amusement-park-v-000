class RidesController < ApplicationController
  def new
  end

  def create
    @ride = Ride.new(user: current_user, attraction: Attraction.find(params[:attraction]))
    if @ride.take_ride == true
      @ride.save
      notice = "Thanks for riding the #{@ride.attraction.name}!"
    else
      notice = @ride.take_ride
    end

    redirect_to user_path(current_user), notice: notice
  end
end
