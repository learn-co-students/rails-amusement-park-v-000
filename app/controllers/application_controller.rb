class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user

  def home
  end

  private

  def set_current_user
    @current_user = current_user if logged_in?
  end

  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    redirect_to root_path if !logged_in?
  end

  def require_admin
    redirect_to user_path(@current_user) unless @current_user.admin
  end
  
end
