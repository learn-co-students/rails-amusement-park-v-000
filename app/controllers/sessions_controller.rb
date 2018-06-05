class SessionsController < ApplicationController

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.find(params['user_name'])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
  end
end
