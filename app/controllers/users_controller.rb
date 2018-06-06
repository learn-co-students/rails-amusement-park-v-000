class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      current_user(@user.id)
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
      @current_user = current_user
      @logged_in = logged_in?
    else redirect_to '/'
    end
  end


end
