class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end


  def logged_in?
    !!session[:user_id]
  end

  def admin
    current_user.admin
  end

  helper_method :logged_in?, :current_user, :authenticate, :admin #why do i need this?
end
