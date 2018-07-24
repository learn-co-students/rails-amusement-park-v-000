require 'pry'
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user && @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if logged_in?
      @user = current_user
    else
      redirect_to root_path
    end
  end

  private

  def user_params
      params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
  end

end
