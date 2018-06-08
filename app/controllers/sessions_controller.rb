class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    login
    @user = User.find(session[:user_id])
    redirect_to user_path(@user)
  end

  def logout
    session.clear
    redirect_to root_path
  end

end
