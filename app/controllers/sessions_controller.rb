class SessionsController < ApplicationController
  def signin
    @users = User.all
  end

  def authenticate
    render html: "We are gonna authenticate the fuck out of you, motherfucker!"
  end

  def logged_in?
    session[:user_id]
  end

  def this_user?
    logged_in? && session[:user_id].to_i == params[:id].to_i
  end
end
