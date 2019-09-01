class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user
      flash[:notice] = "User Name Already Taken."
      redirect_to new_user_path
    elsif !@user
      user = User.create(user_params)
      redirect_to new_user_path unless user
      session[:user_id] = user.id
      redirect_to user_path(current_user)
    end
  end

  def show
    @user = current_user

  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

  def require_login
    unless logged_in
      flash[:notice] = "You need to be signed in to access this page."
      redirect_to root_path
    end
  end

end
