class SessionsController < ApplicationController
  def index
  end

  def new
    @users = User.all
  end

  def create
    user = User.find_by(name: params[:user_name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
