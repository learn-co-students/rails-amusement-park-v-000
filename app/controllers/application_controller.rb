class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :is_admin?
  
  def is_current_user?(params_id)
    params_id.to_i == session[:user_id]
  end

  def logged_in?
    session[:user_id]
  end

  def current_user 
    User.find(session[:user_id])
  end

  def is_admin?
    user = current_user
    user && user.admin 
  end
end
