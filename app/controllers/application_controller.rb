class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?


  private

  def logged_in?
    session[:user_id]
  end

  def require_login
    redirect_to root_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if logged_in?
  end
end
