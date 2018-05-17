class RidesController < ApplicationController
  def create
    @ride = Ride.create(ride_params)
    @user = User.find(current_user)
    @attraction = Attraction.find(params[:ride][:attraction_id])
    @user.ticket_count(@attraction)
    @user.mood_change
    #when the user is tall enough and has enough tickets, clicking on 'Go on ride' displays a thank you message

    if (@user.height > @attraction.min_height) && (@user.tickets >= @attraction.tickets)
      flash[:notice] = "Thanks for riding the #{@attraction.name}!"
    end

    redirect_to @user
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
