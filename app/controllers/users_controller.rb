class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user_signup
    if @user
      redirect_to user_path
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end

end
