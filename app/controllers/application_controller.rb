class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception


  def home
  end
  
  helper_method :current_user, :logged_in?, :require_logged_in

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!current_user
  end

  def require_logged_in
    redirect_to root_path unless logged_in?
  end

 end
