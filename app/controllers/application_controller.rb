class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

end
