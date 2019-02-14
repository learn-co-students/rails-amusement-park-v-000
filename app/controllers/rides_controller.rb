class RidesController < ApplicationController

  def create
    ride = Ride.new( user_id: current_user.id, attraction_id: attraction_params[:id] )
    error_msg = ride.error_msg
    if !error_msg.blank?
      flash[:error] = error_msg
      redirect_to user_path(current_user.id)
    else
      ride.save
      user = User.find(current_user.id)
      user.take_ride(ride)
      flash[:success] = "Thanks for riding the #{ride.attraction_name}!"
      redirect_to user_path(current_user.id)
    end
  end

  private

    def attraction_params
      params.require(:attraction).permit(:id)
    end

end
