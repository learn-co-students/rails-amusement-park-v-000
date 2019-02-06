class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
  end

  def ride
    prev = Rails.application.routes.recognize_path(request.referrer)
    @ride = Ride.new(user_id: current_user.id, attraction_id: prev[:id])
    msg = @ride.take_ride
    redirect_to user_path(current_user), :notice => msg
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :happiness, :nausea, :height, :tickets, :admin)
  end




end
