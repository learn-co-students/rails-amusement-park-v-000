class RidesController < ApplicationController

  def new
    #binding.pry

  end

  def create
    #binding.pry
    @ride = Ride.create(attraction_id: params[:attraction][:attraction_id]) #checked params and this is how it's coming through
    @ride.user_id = current_user.id
    @ride.save
    #need to pass in user and attraction id for take ride method
    #need to pass in attraction from view
    @user = current_user
    flash[:notice] = @ride.take_ride
    #method is working-is changing ticket number, just flash message isn't working
    redirect_to user_path(@user)
  end


end
