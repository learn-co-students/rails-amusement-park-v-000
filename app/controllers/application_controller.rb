class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

def authentication_required
  if !logged_in?
    redirect_to root_path
  end
end

def logged_in?
  !!current_user
end

#if I started a session, le me know the current user, if you  have it, if not, find it and give it to me!
  def current_user
     @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
