class SessionsController < ApplicationController
  def signin
    @users = User.all
  end

  def authenticate
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect_to @user
    else
      redirect_to action: 'signin'
    end
  end

  def signout
    session.delete(:user_id)

    redirect_to root_url
  end

  protected

  def logged_in?
    session[:user_id]
  end

  def this_user?
    logged_in? && session[:user_id].to_i == params[:id].to_i
  end
end
