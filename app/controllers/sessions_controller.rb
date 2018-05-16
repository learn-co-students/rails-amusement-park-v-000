class SessionsController < ApplicationController


  def new
    @users = User.all
  end

  def create
    byebug
    #need to authenticate user
    @user = User.find(params[:user][:id])
    if @user.authenticate(params[:password])
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
  end







end
