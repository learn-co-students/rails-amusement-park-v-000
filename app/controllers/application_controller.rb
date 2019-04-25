class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
