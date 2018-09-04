class RidesController < ActionController::Base

  def create
    @ride = Ride.create(ride_params)
    @ride_message = @ride.take_ride

    if @ride_message != true
      flash[:message] = @ride_message
    else
      flash[:message] = "Thanks for riding the #{@ride.attraction.name}!"
      # render 'users/show'
    end
      @user = @ride.user
      redirect_to user_path(@user)
  end

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
