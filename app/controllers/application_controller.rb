class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def home
  end

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
      # if @current_user return nil the very first time we could do an "or equal"
      #  operator that will say if there is no current user then do a User.find_by
    end

    def logged_in?
      !!current_user
    end

    def authenticate_user
      if !logged_in?
        redirect_to root_path
      end
    end

end
