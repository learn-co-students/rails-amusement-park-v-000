require 'pry'

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if session[:user_id] == @user.id
      render :show
    else
      redirect_to '/'
    end
  end

  def edit
  end

  def update
    # binding.pry
    @user = User.find(params[:id])
    @user.update()
    redirect_to user_path(@user)
  end

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

end
