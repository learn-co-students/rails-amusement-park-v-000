class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def index
  end

  def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
     !!session[:user_id]
    end

  private

    def require_login
      redirect_to root_path unless logged_in?
    end

end
