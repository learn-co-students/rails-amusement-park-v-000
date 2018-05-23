class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def login
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :admin, :height, :tickets)
  end
end
