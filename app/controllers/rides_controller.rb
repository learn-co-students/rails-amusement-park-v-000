require 'rack-flash'

class RidesController < ApplicationController

  use Rack::Flash

  def create
    @ride = Ride.new(ride_params)
    @ride.user_id = current_user.id
    @ride.save
    flash[:notice] = @ride.take_ride
    # if @ride.take_ride == "success"
      redirect_to user_path(@ride.user)
    #   flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
    # elsif @ride.take_ride == "short"
    #   redirect_to user_path(@ride.user)
    #     flash[:message] = "Sorry. You are not tall enough to ride the #{@ride.attraction.name}."
    # elsif @ride.take_ride == "no tickets"
    #     redirect_to user_path(@ride.user)
    #     flash[:notice] = "Sorry. You do not have enough tickets to ride the #{@ride.attraction.name}."
    # elsif @ride.take_ride == "short and no tickets"
    #   redirect_to user_path(@ride.user)
    #     flash[:notice] = "Sorry. You do not have enough tickets to ride the #{@ride.attraction.name}. You are not tall enough to ride the #{@ride.attraction.name}."
    # end
  end

  private

  def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end

end
