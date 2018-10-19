require 'pry'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorized_user?
  
  def current_user
  	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
  	!!current_user
  end
  
  def authorized_user?
  	!!current_user.admin
  end
  
end
