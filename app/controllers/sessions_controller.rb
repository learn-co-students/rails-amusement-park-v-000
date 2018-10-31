class SessionsController < ApplicationController
  require 'pry'

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(id: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Welcome back to the theme park!"
    else
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
