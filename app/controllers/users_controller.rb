class UsersController < ApplicationController
  before_action :require_log_in, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return redirect_to root_path unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user.id)
  end

  def show
    if logged_in?
      @user = User.find(session[:user_id])
    else
      return redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

end
