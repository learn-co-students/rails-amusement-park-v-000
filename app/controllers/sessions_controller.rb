class SessionsController < ApplicationController


  def new
    @users = User.all
  end

  def create
    @user = User.find(params[:user][:id])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to :signin
    end
  end

  def destroy
    byebug
    session.delete :user_id
  end







end
