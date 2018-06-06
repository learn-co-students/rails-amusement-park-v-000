class RidesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def create
    # puts "Ride Params =  #{params}"
    # 1) Check if user can ride attraction
    # 2) If yes -> Save Ride + update info
    # 3) redirect to confirmation/failure page (based on flash notice)

    ride = Ride.new(ride_params)
    # puts "take ride = #{ride.take_ride}"
    if ride.check_ride == ""
      ride.save
      ride.take_ride
      flash[:notice] = "Thanks for riding the #{ride.attraction.name}!"
    else
      flash[:notice] = ride.check_ride
    end
    redirect_to user_path(current_user)
  end

  private

  def ride_params
    params.permit(:user_id, :attraction_id)
  end

end
