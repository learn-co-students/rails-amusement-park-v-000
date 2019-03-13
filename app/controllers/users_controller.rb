class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    if params[:user][:admin] == true
      session[:user_admin] = true
    end
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def show
    if session[:user_id] == nil
      redirect_to root_path
    end
    @user = User.find(params[:id])
  end


  def update
  end


  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :happiness, :nausea, :tickets, :height, :admin)
  end


end
