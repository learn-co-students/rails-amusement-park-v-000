class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def current_user
    return unless session[:user_id]
    # return @current_user or set @current_user
    @current_user ||= User.find(session[:user_id])
  end

  def find_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end
end
