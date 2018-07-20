class RidesController < ApplicationController
  before_action :require_login

  def new
    @ride = Ride.new(user_id: current_user.id, attraction_id: params[:attraction_id])
    message = @ride.take_ride
    redirect_to user_path(current_user), notice: message
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
