class RidesController < ApplicationController

  def create
    # when the user clicks on "Go on this ride":
    # 1 - assign the user to the ride
    # 2 - assign the attraction to the ride
    # 3 - update the tickets a user has
    @ride = Ride.create(ride_params)
    @user = User.find(@ride.user_id)
    @attraction = Attraction.find(@ride.attraction_id)

    @user.tickets = @user.tickets - @attraction.tickets

    if @user.save
      redirect_to user_path(@user)
    end
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

end
