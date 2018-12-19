class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #Identify the user interacting with the website
  before_action :current_user
  #If the user is not signing up, creating a new user or attempting to visit the home page, make sure that they are logged in.
  before_action :require_logged_in, except: [:new, :create, :home]

  def logged_in?
  #uses the private current_user method and a double negative to check that the user has a valid session[:user_id]
    !!current_user
  end

  private
    def require_logged_in
      #leverages logged_in to redirect users to root_path which is set in config/routes.rb 
      redirect_to root_path unless logged_in?
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
end
