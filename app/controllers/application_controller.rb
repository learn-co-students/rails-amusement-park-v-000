class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?
  
  def is_current_user?(params_id)
    params_id.to_i == session[:user_id]
  end

  def logged_in?
    session[:user_id]
  end

  def current_user 
    User.find(session[:user_id])
  end
end
