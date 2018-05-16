class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
  session[:id] ||= nil
end

  def logged_in?
    redirect_to controller: 'users', action: 'new' unless current_user
  end
end
