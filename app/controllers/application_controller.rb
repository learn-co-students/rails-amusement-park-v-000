class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    session.include?(:user_id)
  end

  def current_user
    User.find(session[:user_id])
  end
end
