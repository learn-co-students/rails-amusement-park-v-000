class RidesController < ApplicationController

  def create
    @user = User.find_by(id: params[:user_id])
    @attraction = Attraction.find(params[:attraction_id])
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
   
    if @errors == nil
      flash[:notice] = "Thanks for riding the #{@attraction.name}!"
      redirect_to user_path(@user)
    else
      flash[:notice] = @errors
      redirect_to user_path(@user)
    end
  end
 end
