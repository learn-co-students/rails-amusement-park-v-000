class RidesController < ApplicationController

  def new
    @ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    user = User.find(@ride.user_id)
    attraction = Attraction.find(@ride.attraction_id)

    @ride.take_ride

      if user.tickets > attraction.tickets && user.height > attraction.min_height
        flash[:message] = "Thanks for riding the #{attraction.name}!"
      elsif user.tickets < attraction.tickets && user.height < attraction.min_height
        flash[:message] = "You are not tall enough to ride the #{attraction.name}. You do not have enough tickets to ride the #{attraction.name}"
      elsif user.height < attraction.min_height
        flash[:message] = "You are not tall enough to ride the #{attraction.name}"
      elsif user.tickets < attraction.tickets
        flash[:message] = "You do not have enough tickets to ride the #{attraction.name}"
      end

    redirect_to user_path(User.find(@ride.user_id))
  end

end
