class UsersController < ApplicationController

  def index
    @user = User.all
  end
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless user.save
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :happiness, :nausea, :tickets, :height)
  end
end
