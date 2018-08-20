class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
end
