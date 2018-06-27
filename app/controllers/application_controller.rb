class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    @user = current_user if logged_in?
  end

  private

  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    redirect_to root_path if !logged_in?
  end

end
