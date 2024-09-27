class RidesController < ApplicationController
  def create
    params[:ride][:user_id] = session[:user_id]
    #get the user_id from the session hash and add it to params
    @user = User.find(session[:user_id])
    #store user in @user for show page where redirected to
    #creates a ride with user_id and attraction_id attributes (always built off attraction?)
    @ride = Ride.new(ride_params)
    #runs the take_ride method on the associated objects
    if @ride.save && @user.tickets && @user.happiness && @user.nausea
      flash[:notice] = @ride.take_ride
      end
    redirect_to user_path(@user)

  end



private

  def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end
end
