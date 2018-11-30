class RidesController < ApplicationController

  def new

  end

  def create
    @ride = Ride.create(attraction_id: params[:attraction][:attraction_id]) #checked params and this is how it's coming through
    @ride.user_id = current_user.id
    @ride.save
    #need to pass in user and attraction id for take ride method
    #need to pass in attraction from view
    @user = current_user
    @message =  @ride.take_ride #view will now have access
    redirect_to user_path(@user, message: @message)
  end


end
