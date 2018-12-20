class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :current_user
  before_action :required_logged_in, except: [:new, :create, :home]

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private
  
    def required_logged_in
      redirect_to root_path unless logged_in?
    end


end
