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
    @message =  @ride.take_ride
    redirect_to user_path(@user, message: @message) #@message won't be accessible in show view, need to access :message through params in show action
  end


end
