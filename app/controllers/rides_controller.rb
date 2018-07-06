class RidesController < ApplicationController

  def create
    @ride = Ride.create(:user_id => params[:ride][:user_id], :attraction_id => params[:ride][:attraction_id])
    redirect_to user_path(@ride.user, :message => @message)
  end

end
