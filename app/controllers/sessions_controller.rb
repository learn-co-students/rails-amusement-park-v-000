class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    if user = User.authenticate_credentials(params[:user][:name], params[:user_password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end