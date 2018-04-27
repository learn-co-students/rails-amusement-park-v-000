class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

#should these be moved into sessions controller?

  helper_method :current_user, :logged_in?, :admin?

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to root_path unless logged_in?
  end

  def is_admin?
    current_user.admin
  end
end
