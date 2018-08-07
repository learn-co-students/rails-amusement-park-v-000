class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?,

  def welcome
  end


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


  def logged_in?
    !!current_user
  end


  def authorization_required
    if logged_in?
      redirect_to root_path
    else 
      redirect_to login_path 
    end
  end 


end
