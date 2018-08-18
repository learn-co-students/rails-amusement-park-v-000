class RidesController < ApplicationController

  def create
    @ride = Ride.new(ride_params)
    if @ride.save
      @ride.after_ride
      redirect_to user_path(session[:user_id])
    else
      @errors = @ride.errors.messages[:base]
      @user = User.find(params[:ride][:user_id])
      render :template => "users/show"
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
