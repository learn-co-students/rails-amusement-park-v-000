class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :current_user
  before_action :logged_in_req, except: [:new, :create, :home]

  def logged_in?
    !!current_user
  end

  private

  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in_req
    redirect_to root_path unless logged_in?
  end

end
