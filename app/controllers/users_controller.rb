class UsersController < ApplicationController

  def welcome
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_users_path
    end
  end

  def show
    if session[:user_id]
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def signin
    @user = User.new
  end

  def login
    @user = User.find(params[:user][:name])

    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

end
