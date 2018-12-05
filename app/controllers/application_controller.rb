class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user, except: [:home, :new, :create]
  before_action :require_logged_in, except: [:new, :create, :home, :signin]

  def logged_in?
    !!current_user #return boolean value
  end

  private  #:require_logged_in rendered or redirected this is the sign in issue
    def require_logged_in
      redirect_to root_path unless logged_in?
    end

    def current_user #if no current_user the find by user_id in session
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
end
