class RidesController < ApplicationController
  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.create(ride_params)
    @user = User.find_by(id: session[:user_id])

    feedback_message = @ride.take_ride
      
    if feedback_message.include? "Sorry"
      flash[:danger] = feedback_message
    else
      flash[:success] = feedback_message
    end

    redirect_to user_url(@user)
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
