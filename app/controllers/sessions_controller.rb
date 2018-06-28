class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(:id => params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to :new
    end
  end

  def destory
    session.clear
    redirect_to root_path
  end

end
