class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    @user = User.find_by(id: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Invalid login credentials"
      redirect_to '/signin'
    end
  end

  def delete
    session.clear
    redirect_to '/'
  end

end
