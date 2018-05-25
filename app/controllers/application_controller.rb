class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :require_login, :user_is_admin?

  def home
  end

  def logged_in?
    !!self.current_user
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to root_path unless logged_in?
  end

  def user_is_admin?
    current_user.admin
  end


end
