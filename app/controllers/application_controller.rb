class ApplicationController < ActionController::Base
  helper_method :current_user 
  protect_from_forgery with: :exception
  
  def welcome
    render '/welcome'
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def authorize
    redirect_to '/' unless logged_in?
  end
  
end
