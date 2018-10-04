class RidesController < ApplicationController
  def new
    @user = current_user
    @attraction = Attraction.find(params[:attraction_id])
    @ride = Ride.new(attraction_id: params[:attraction_id], user_id: params[:user_id])
    # binding.pry
    if @ride
      status = @ride.take_ride
      @ride.save
      redirect_to user_path(@user)
      flash[:notice] = "#{status}"
    else
      render :new
    end
  end
end
