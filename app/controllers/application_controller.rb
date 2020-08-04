class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user
  helper_method :logged_in?
  
      def current_user
          @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end
  
      def logged_in?
          !!current_user
      end
  
      def redirect_if_not_logged_in
          if  !logged_in?
            redirect_to '/login'
          end
      end

      def logout!
          session.clear
      end

  end
