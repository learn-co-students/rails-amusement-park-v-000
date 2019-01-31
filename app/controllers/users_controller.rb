class UsersController < ApplicationController

  before_action :not_logged_in, only: [:show]

  def welcome
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def update
    ride = Ride.create(user_id: params[:id], attraction_id: params[:attraction_id])
    @ride_message = ride.take_ride

    render :show
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
  end

end
