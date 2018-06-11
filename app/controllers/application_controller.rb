class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :is_admin?

  def home
  end

  def current_user
    @user = User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authentication_redirect
    redirect_to root_path unless logged_in?
  end

  def is_admin?
    current_user.admin
  end

  def admin_redirect
    redirect_to attractions_path, flash[:notice] => "Not an Admin" unless is_admin?
  end
end