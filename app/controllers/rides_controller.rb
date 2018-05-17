class RidesController < ApplicationController
  def create

    @user = User.find(current_user)
    @attraction = Attraction.find(params[:ride][:attraction_id])

    if !@attraction.tall_enough?(@user)
      flash[:notice] = "You are not tall enough to ride the #{@attraction.name}"
    end

    if !@attraction.tickets_enough?(@user)
      flash[:notice] = "You are not tall enough to ride the #{@attraction.name}"
    end

    byebug
    if @attraction.tickets_enough?(@user) && @attraction.tall_enough?(@user)
      @ride = Ride.create(ride_params)
      @user.ticket_count(@attraction)
      @user.mood_change
      flash[:notice] = "Thanks for riding the #{@attraction.name}!"
    end

    redirect_to @user
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
