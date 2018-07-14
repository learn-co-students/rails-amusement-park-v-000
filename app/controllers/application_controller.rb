class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    current_user ||= session[:user_id] &&
      User.find_by(id: session[:user_id])
  end



end
