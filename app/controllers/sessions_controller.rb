require 'pry'

class SessionsController < ApplicationController

  def destroy
    session[:user_id] = nil
    redirect_to new_path
  end

  def new   # sign_in
    @users = User.all
    @user = User.new
#    @user.id = session[:user_id]
  end

  def create
    @user = User.find_by(:name => params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      sessions[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end


end
