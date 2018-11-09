module ApplicationHelper
    def require_login
        redirect_to root_path unless logged_in?
      end
    
      def logged_in?
        !!current_user
      end
    
      def current_user
        @_current_user ||= User.find_by(:id => session[:user_id])
      end
end