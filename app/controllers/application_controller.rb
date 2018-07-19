class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :login_required, except: [:welcome, :new, :create]
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def login_required
    redirect_to root_path unless logged_in?
  end
end
