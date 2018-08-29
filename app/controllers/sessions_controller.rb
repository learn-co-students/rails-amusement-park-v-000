class SessionsController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    user = User.find_by(id: params[:user_name])
    if !user
      redirect_to root_path
    else
      session[:user_id] = user.id
      redirect_to user_path(user)
    end
  end

  def destroy
    session.clear
    redirect_to root_url
  end
end
