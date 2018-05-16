class SessionsController < ApplicationController


  def new
    @users = User.all
  end

  def create
    byebug
    #need to authenticate user
    @user = User.find(params[:user][:id])
    @user.authenticate(params[:password])
    params[:user]
    params[:password]
  end

  def destroy
  end







end
