class RidesController < ApplicationController
  before_action :require_login

  def create
      @ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])
      if @ride.save
          @message =  @ride.take_ride
          redirect_to user_path(@ride.user, message: @message)
      end
  end

end
