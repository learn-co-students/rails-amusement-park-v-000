class RidesController < ApplicationController
  before_action :user_must_be_logged_in # Edge case, defined in ApplicationController

  def create
    att = Attraction.find_by_id(params[:attraction_id])
    # Interesting bug: If I say find_by instead of find_by_id, att is the Attraction whose id is 1.

    ride = Ride.new(user: current_user, attraction: att)
    flash[:ride_message] = ride.take_ride

    if flash[:ride_message] == "Thanks for riding the #{att.name}!"
      ride.save # Only associates the attraction and the user if the user successfully rides it
    end

    redirect_to user_path(current_user)
  end
end
