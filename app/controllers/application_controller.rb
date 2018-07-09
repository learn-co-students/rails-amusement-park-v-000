class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :admin?

  def require_login
    redirect_to root_path if !logged_in?
  end

  def logged_in?
    !!current_user
  end

  def admin?
    current_user.admin if logged_in?
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end



end
