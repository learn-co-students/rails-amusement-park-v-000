class RidesController < ApplicationController
  def create
    #@user = User.find(current_user)
    #@attraction = Attraction.find(params[:ride][:attraction_id])
    @ride = Ride.create(ride_params)
    flash[:notice] = @ride.take_ride

=begin
    if !@attraction.tall_enough?(@user)
      flash[:notice] = "You are not tall enough to ride the #{@attraction.name}"
    end

    if !@attraction.tickets_enough?(@user)
      flash[:notice] = "You do not have enough tickets to ride the #{@attraction.name}"
    end

    if !@attraction.tickets_enough?(@user) && !@attraction.tall_enough?(@user)
      flash[:notice] = "You are not tall enough to ride the #{@attraction.name}.
      You do not have enough tickets to ride the #{@attraction.name}"
    end

    if @attraction.tickets_enough?(@user) && @attraction.tall_enough?(@user)
      @ride = Ride.create(ride_params)
      @user.ticket_count(@attraction)
      #@user.mood_change
      flash[:notice] = "Thanks for riding the #{@attraction.name}!"
    end
=end
    redirect_to @user
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
