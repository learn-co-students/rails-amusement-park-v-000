class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  def home
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    if !logged_in?
      redirect_to root_path
    end
  end

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

end
