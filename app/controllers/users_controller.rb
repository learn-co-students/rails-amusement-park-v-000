class UsersController < ApplicationController
  # before_action :authentication_required

  def index
    logged_in?
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
    end

    redirect_to user_path(user)
  end

  def show
    if !logged_in?
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

end
