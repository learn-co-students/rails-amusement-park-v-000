class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def show
    @user = User.find_by_id(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :height, :admin, :nausea, :tickets)
  end
end
