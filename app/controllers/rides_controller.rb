class RidesController < ApplicationController

  def new
    # binding.pry
    @user = User.find(params[:user_id])
    @ride = Ride.create(:user_id => @user.id, :attraction_id => params[:attraction_id])
    # flash[:notice] = ride.take_ride
    @message = @ride.take_ride
    # binding.pry
    redirect_to user_path(@ride.user, :message => @message)
  end

end
