class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :current_user
  before_action :please_log_in
  skip_before_action :please_log_in, only: [:new, :create, :home]

  def logged_in?
    !!current_user
  end

private
  def please_log_in
    if !logged_in?
      redirect_to root_path
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

end
