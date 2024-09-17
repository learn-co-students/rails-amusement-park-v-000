class UsersController < ApplicationController
  helper_method :current_user, :logged_in?
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end
end
