class RidesController < ApplicationController
  def create
    params[:ride][:user_id] = session[:user_id]
    @user = User.find(session[:user_id])
    @ride = Ride.new(ride_params)
    if @ride.save && @user.tickets && @user.happiness && @user.nausea
      flash[:notice] = @ride.take_ride
      end
    redirect_to user_path(@user)

  end



private

  def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end
end
