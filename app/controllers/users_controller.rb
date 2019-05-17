class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    byebug
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :password_confirmation, :admin)
  end
end
