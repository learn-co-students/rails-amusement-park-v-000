class UsersController < ApplicationController

  def home

  end

  def new
    @user = User.new
  end

  def create
    user_signup
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.save
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end


end
