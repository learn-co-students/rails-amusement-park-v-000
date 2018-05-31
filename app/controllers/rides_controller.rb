class RidesController < ApplicationController
  def new
  end

  def create
    #raise params.inspect
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @attraction = Attraction.find(params[:attraction_id])
    message = @ride.take_ride
    binding.pry
    if message
      @message = "Thanks for riding the #{@attraction.name}!"
    else
      @message = message
    end
    redirect_to user_path(params[:user_id])
  end

end
