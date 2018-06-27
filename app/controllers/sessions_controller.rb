class SessionsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def new
    @users = User.all
  end

  def create
    @user = User.find(params[:user][:name]) #=> actually passes id, but shows name in form
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
