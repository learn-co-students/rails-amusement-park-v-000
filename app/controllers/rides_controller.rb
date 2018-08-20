class RidesController < ApplicationController

  def new
    if logged_in? && !current_user.admin
      @user = User.find(session[:user_id])
      @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])

      session[:ride_message] = @ride.take_ride
      redirect_to user_path(@ride.user_id)
    else
      redirect_to edit_attraction_path(@user)
    end
  end

end
