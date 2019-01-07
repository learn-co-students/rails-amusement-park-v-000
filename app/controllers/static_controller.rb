class StaticController < ApplicationController

  def home
  end

  def signin
    User.find_by(name: params[:name], password: params[:password])
  end

  def logout
    session.delete(:user_id) if session[:user_id]
    redirect_to root_url
  end
end
