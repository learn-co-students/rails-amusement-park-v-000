class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def require_login
    redirect_to root_path if !session[:user_id]
  end
  
  helper_method :current_user
end
