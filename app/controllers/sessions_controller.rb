class SessionsController < ApplicationController
  def signin
    @users = User.all
  end

  def logged_in?
    session[:user_id]
  end

  def this_user?
    logged_in? && session[:user_id].to_i == params[:id].to_i
  end
end
