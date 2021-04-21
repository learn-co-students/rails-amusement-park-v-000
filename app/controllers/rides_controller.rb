class RidesController < ApplicationController
  #join table

  def create
    user = User.find(params[:user_id])
    attraction = Attraction.find(params[:attraction_id])
    ride = Ride.create(user_id: user.id, attraction_id: attraction.id)

    if ride.valid? && ride.rider_allowed?
      ride.pay_fee
      redirect_to user_path(user), notice: "Thanks for riding the #{attraction.name}!"
    else
      flash[:alert] = []
      flash[:alert] << "You are not tall enough to ride the #{attraction.name}!" if !ride.tall_enough 
      flash[:alert] << "You do not have enough tickets to ride the #{attraction.name}!" if !ride.enough_tickets 
      redirect_to user_path(user)
    end
  end

end