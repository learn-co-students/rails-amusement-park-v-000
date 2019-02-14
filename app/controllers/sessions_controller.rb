class SessionsController < ApplicationController

  def new
    @users = User.all
  end

  def create
    user = User.find_by(name: params[:user][:name])

    user = user.try(:authenticate, params[:user][:password])

    return redirect_to(controller: 'sessions', action: 'new') unless user

   session[:user_id] = user.id

   @user = user

   redirect_to controller: 'users', action: 'index'
  end

  def current_user
    @current_user ||= session[:user_id] &&
      User.find_by(id: session[:user_id])
  end

  def signin
  end
end
