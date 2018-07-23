class UsersController < ApplicationController
  before_action :lo_redirector, only: [:show]

  def ride
    @ride = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @ride.take_ride
    redirect_to user_path(current_user)
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
      params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password)
    end

end
