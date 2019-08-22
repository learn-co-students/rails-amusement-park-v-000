class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    @user = User.find(params[:user_name])
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      redirect_to @user
    else
      flash.now[:message] = "Unable to login."
      render :new
      end
  end

  def destroy
    session[:user_id] = nil

  end

  def create
    user = User.find_by(name: params[:user][:name])
    user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect_to user
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
