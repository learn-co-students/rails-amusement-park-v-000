class RidesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @ride = Ride.create(:user_id => @user.id, :attraction_id => params[:attraction_id])
    @message = @ride.take_ride
    redirect_to user_path(@ride.user, :message => @message)
  end

end
