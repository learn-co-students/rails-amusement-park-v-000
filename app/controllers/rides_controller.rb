class RidesController < ApplicationController

  def show
  end

  def new
    @ride = Ride.new(attraction_id: params[:id])
  end

  def create
    @ride = Ride.create(user_id: session[:user_id], attraction_id: session[:attraction_id])
    #@attraction = User.find_by_id(params[:id])
    @ride.take_ride

    @user = @ride.user
    @attraction = @ride.attraction

    if @user.height < @attraction.min_height && @user.tickets < @attraction.tickets
      flash[:fail] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
      redirect_to user_path(@ride.user)
    elsif @user.height < @attraction.min_height
      flash[:too_short] = "Sorry. You are not tall enough to ride the #{@attraction.name}."
      redirect_to user_path(@ride.user)
    elsif @user.tickets < @attraction.tickets
      flash[:too_few_tickets] = "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
      redirect_to user_path(@ride.user)
    elsif @user.height >= @attraction.min_height && @user.tickets >= @attraction.tickets
      flash[:ride_success] = "Thanks for riding the #{@attraction.name}!"
      redirect_to user_path(@ride.user)
    end
  end

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
