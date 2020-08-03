class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user
  helper_method :logged_in?
  
     def current_user
          @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #    if session[:user_id]
    #      @current_user ||= User.find(session[:user_id])
    #    else
    #      @current_user = nil
    #    end
      end
  
      def logged_in?
          !current_user.nil?
      end

  
  end
