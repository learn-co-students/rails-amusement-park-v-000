class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :require_login
  
    def current_user
      @user = User.find_by(session[:user_id]) || User.new
    end

    def logged_in?
      !!current_user
    end

    def require_login
      redirect_to root_path unless logged_in?
    end

    def admin?
      current_user.admin if logged_in?
    end

    helper_method :admin?
end
