class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_logged_in
    redirect_to '/' if !logged_in?
  end

end
