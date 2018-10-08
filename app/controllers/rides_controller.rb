class RidesController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @attraction = Attraction.find(params[:attraction_id])
    @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
    @errors = @ride.take_ride
    if @errors == nil
      flash[:notice] = "Thanks for riding the #{@attraction.name}!"
      redirect_to user_path(@user)
    else
      flash[:notice] = @errors
      redirect_to user_path(@user)
    end
  end

end
