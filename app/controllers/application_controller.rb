class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  
  def current_user
  @current_user ||= User.find_by_id(session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end

  helper_method :logged_in?
  helper_method :current_user
end
