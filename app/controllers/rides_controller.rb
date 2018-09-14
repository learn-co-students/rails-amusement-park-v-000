class RidesController < ApplicationController
  def create
    @attraction = Attraction.find(params[:attraction_id])
    @user = User.find(session[:user_id])

    @ride = Ride.create(:user_id => @user.id, :attraction_id => @attraction.id)

    flash[:message] = @ride.take_ride

    redirect_to user_path(@user)
  end
end
