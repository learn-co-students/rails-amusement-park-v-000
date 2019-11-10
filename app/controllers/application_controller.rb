class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authentication_required
    if !logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # Methods you build in controllers do not permeate to
  # the ActionView part of your code...
  # You cannot call this in your html.erb unless you say explicitly That
  # this is a "helper_method" - at which
  helper_method :current_user
end
