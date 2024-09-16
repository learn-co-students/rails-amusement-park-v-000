class RidesController < ApplicationController
  def create
    @user = User.find(current_user.id)
    @ride = Ride.create(:user_id => current_user, :attraction_id =>params[:ride][:attraction])
    @ride.user_id = current_user.id
    flash[:message] = @ride.take_ride
    @ride.save
    redirect_to user_path(@user)
  end
end 