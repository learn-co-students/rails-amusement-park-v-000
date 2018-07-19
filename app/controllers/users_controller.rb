class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id 
    redirect_to user_path(@user)
  end
  
  def show
    redirect_to root_path if !logged_in?
    @user = User.find_by(id: session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :tickets, :happiness, :nausea, :admin, :height)
  end

  def logged_in?
    !!session[:user_id]
  end
end
