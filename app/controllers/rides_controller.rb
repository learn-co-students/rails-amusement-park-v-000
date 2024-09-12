class RidesController < ApplicationController
  def create
    # "ride"=>{"user_id"=>"14", "attraction_id"=>"1"}
    ride = Ride.new(user_id: params[:ride][:user_id], attraction_id: params[:ride][:attraction_id])

    flash[:notice] = ride.take_ride
    ride.save
    redirect_to user_path current_user

  end
end
