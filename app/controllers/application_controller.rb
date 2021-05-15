class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user(user)
    session[:user_id] = user.id
  end
end
