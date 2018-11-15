class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :user_login, :user_signup, :admin?, :logged_in?

  def user_signup
    session[:user_id] = @user.id
  end

  def user_login
    session[:user_id] = @user.id
  end

  def admin_signup

  end

  def admin_login

  end

  def current_user
    current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def admin?
    current_user.admin if logged_in?
  end

end
