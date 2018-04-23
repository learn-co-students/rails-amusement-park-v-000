class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def log_in?
    !!current_user
  end

  def password_required
    redirect_to root_path if !log_in?
  end
end
