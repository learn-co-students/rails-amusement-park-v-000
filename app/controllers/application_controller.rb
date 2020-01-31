class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  def index
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    # session[:user_id].present? # Not blank (checks against "", ' ', nil, etc)
    !!current_user
  end

  private

    def user_must_be_logged_in
      if !logged_in?
        flash.alert = "You must be logged in to view this page."
        redirect_to root_path # and return (not needed, at least not yet)
      end
    end
end
