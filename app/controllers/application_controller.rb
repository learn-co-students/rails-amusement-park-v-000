class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def welcome
  end

  helper_method
  def current_user
    session[:user_id]
  end
end
