class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params(:name, :height, :happiness, :nausea, :tickets, :admin, :password))
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

end
