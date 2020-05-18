class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    return redirect_to new_user_path unless @user.save

    session[:user_id] = @user.id

    redirect_to user_path(@user.id)
  end

  def show
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end
end
