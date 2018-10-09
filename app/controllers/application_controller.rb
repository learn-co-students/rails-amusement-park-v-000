class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def logged_in?
    !!current_user
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_log_in
    if !logged_in?
      flash[:message] = "Please log in or sign up!"
      redirect_to root_path
    end
  end

end
