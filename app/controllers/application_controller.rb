class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def home
  end

  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    !!current_user
  end
end
