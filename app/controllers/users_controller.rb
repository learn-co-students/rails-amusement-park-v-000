class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    session[:user_id] = @user.id
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
    # binding.pry
    if session[:user_id] != @user.id
      redirect_to '/'
    elsif @user.rides != []
      @ride = @user.rides[-1]
      @message = @ride.take_ride
      @user = User.find(params[:id])
    end
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

end
