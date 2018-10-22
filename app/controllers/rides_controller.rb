class RidesController < ApplicationController

  def new
  end

  def create
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @user = User.find_by(id: params[:user_id])

    if @ride.valid_rider
      @ride.user_update
      redirect_to user_path(@ride.user.id), :alert => "Thanks for riding the #{@ride.attraction.name}!"
    else 
      redirect_to user_path(@user.id), :alert => @ride.requirement
    end
  end 

end
