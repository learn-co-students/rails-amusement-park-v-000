class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :user_verified
  helper_method :current_user, :logged_in?

  def user_verified
    redirect_to '/' unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    # User.find(session[:user_id]) # causes problem with activerecord
    User.find_by(id: session[:user_id])
  end

end
