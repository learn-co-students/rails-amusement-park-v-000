class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
helper_method :current_user, :logged_in?
before_action :current_user

    def current_user
      # return unless session[:user_id]
      # @user ||= User.find_by(id: session[:user_id])
      @user = (User.find_by(id: session[:user_id]) || User.new)
    end


      def logged_in?
        current_user.id != nil
      end

end
