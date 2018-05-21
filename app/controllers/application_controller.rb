class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home

  end

  def logged_in?
    session.include?(:user_id)
  end

  def login(user)
    session[:user_id] = user.id
  end

end
