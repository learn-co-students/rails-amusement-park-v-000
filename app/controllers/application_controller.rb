class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :require_logged_in, :logged_in?, :current_user
  
  def require_logged_in
    if !logged_in?
     redirect_to 'root_path'
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
end