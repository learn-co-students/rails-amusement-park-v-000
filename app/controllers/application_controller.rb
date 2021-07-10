class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in?
    session[:user_id].present?
  end

  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  def admin?
    !!current_user.admin
  end

  def require_login
    unless session[:user_id].present?
      flash[:error] = "You must be logged in to access that section"
      redirect_to root_path
    end
  end

  def require_admin
    unless admin?
      flash[:error] = "You must be logged in as an admin to access that section"
      redirect_to attractions_path
    end
  end

end
