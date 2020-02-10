class SessionsController < ApplicationController

  def sign_in 
    @user = User.new
  end

  def create
    @user = User.find_by(user_id: params[:user_id])
    if @user && @user.authenticate(params[user_password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render sign_in
