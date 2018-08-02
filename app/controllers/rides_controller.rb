class RidesController < ApplicationController
  include ApplicationHelper

  def ride
    message = current_user.rides.create(attraction_id: params[:ride][:attraction_id]).take_ride
    if message != true
      flash[:error] = message
    else
      flash[:success] = "Thanks for riding the #{current_user.rides.last.attraction.name}!"
    end
    redirect_to user_path(current_user)
  end
end
