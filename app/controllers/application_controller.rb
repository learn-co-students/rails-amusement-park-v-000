class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_user_is_admin?, :logged_in?, :require_logged_in

  def require_logged_in
    if !logged_in?
      redirect_to '/'
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def current_user_is_admin?
    current_user.admin == true
  end
end
