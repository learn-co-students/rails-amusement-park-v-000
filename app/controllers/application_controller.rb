class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def log_in(user)
  	session[:user_id] = user.id
  end

  def current_user
  	User.find_by(id: session[:user_id])
  end

  def logged_in?
  	!!current_user
  end
end
