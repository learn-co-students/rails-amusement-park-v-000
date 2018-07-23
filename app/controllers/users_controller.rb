class UsersController < ApplicationController
  before_action :lo_redirector, only: [:show]

  def ride
    @ride = Ride.create(user_id: params[:ride][:user_id], attraction_id: params[:ride][:attraction_id])
    @alert = @ride.take_ride
    redirect_to user_path(@ride.user), alert: @alert
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
      redirect_to root_path
    end
  end

  def destroy
    session.clear
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
    end

end
