class RidesController < ApplicationController

  #create a new ride
  #ride connects current user to attraction

  def create
    # binding.pry
    @ride = Ride.create(user: current_user, attraction_id: params[:attraction_id])
    @ride.take_ride
    redirect_to user_path(current_user)
  end

  # Parameters {"utf8"=>"✓", "attraction_id"=>"2", "commit"=>"Go on this ride", "controller"=>"rides", "action"=>"create"} 
end
