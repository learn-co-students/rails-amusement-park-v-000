class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :verify_user, :current_user, :logged_in, :admin
  

  def home
  end

  def verify_user
    redirect_to '/' unless logged_in
  end

  def logged_in
    !!session[:user_id]
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def admin
    current_user.admin
  end

end
