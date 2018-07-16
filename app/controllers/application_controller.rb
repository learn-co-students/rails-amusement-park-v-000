class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   helper_method :current_user, :logged_in?

    def current_user
      @user ||= session[:user_id]
    end

    def logged_in?
      !!current_user
    end

end
