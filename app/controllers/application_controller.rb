class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authentication_required, except: [:new, :home, :create]
  def authentication_required
    if !logged_in?
      redirect_to root_path
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]

  end

  helper_method :current_user
  helper_method :logged_in?
end
