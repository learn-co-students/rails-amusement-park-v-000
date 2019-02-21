class RidesController < ApplicationController
  def index

  end


  def create
    @ride = Ride.create(:user_id => params[:ride][:user_id],:attraction_id=>params[:ride][:attraction_id])
    flash[:notice] = @ride.take_ride

    redirect_to user_path(@ride.user)
  end

end
