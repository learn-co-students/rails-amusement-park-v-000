class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_attraction
    current_attraction ||= Attraction.find_by(params[:attraction_id])
  end

  helper_method :current_user, :current_attraction
end
