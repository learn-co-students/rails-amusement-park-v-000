class RidesController < ApplicationController
  def create

    #this controller action is too thick, the logic needs to go elsewhere, most likely in the model
    #this is about what hte user is authorized to do
    @user = User.find(current_user)
    @attraction = Attraction.find(params[:ride][:attraction_id])

    if !@attraction.tall_enough?(@user)
      flash[:notice] = "You are not tall enough to ride the #{@attraction.name}"
    end

    byebug
    if @attraction.min_height > @user.height
      flash[:notice] = "You are not tall enough to ride the #{@attraction.name}"
    end

    if (@user.height > @attraction.min_height) && (@user.tickets >= @attraction.tickets)#user is tall_enough and tickets_enough
      @ride = Ride.create(ride_params)
      @user.ticket_count(@attraction)
      @user.mood_change
      flash[:notice] = "Thanks for riding the #{@attraction.name}!"
    end

    #when the user doesn't have enough tickets, clicking on 'Go on ride' displays a sorry message
    #"You do not have enough tickets to ride the #{@ferriswheel.name}"

    #when the user is too short and doesn't have enough tickets, clicking on 'Go on ride' displays a detailed sorry message
    #"You are not tall enough to ride the #{@rollercoaster.name}"
    #"You do not have enough tickets to ride the #{@rollercoaster.name}"


    redirect_to @user
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
