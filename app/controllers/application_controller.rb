class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    session[:user_id] ||= nil
  end

  def logged_in?
    #redirect_to controller: 'users', action: 'new' unless current_user
    redirect_to root_path unless current_user
  end
end
