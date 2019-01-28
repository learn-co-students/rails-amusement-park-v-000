class RidesController < ApplicationController
  def create
    @ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])

    if @ride.save
      @ride.take_ride
      flash_message
      redirect_to user_path(@ride.user)
    end
  end




  def flash_message
    if  !@ride.tall_enough? && !@ride.enough_tickets?
      flash[:notice] = "Sorry. You are not tall enough to ride the #{@ride.attraction.name}. You do not have enough tickets the #{@ride.attraction.name}"
    elsif !@ride.tall_enough?
      flash[:notice] = "Sorry. You are not tall enough to ride the #{@ride.attraction.name}."
    elsif !@ride.enough_tickets?
      flash[:notice] = "You do not have enough tickets the #{@ride.attraction.name}"
    else
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
    end
  end

end
