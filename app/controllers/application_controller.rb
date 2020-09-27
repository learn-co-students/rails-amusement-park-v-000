class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    User.find(session[:user_id])
  end

  def logged_in?
    redirect_to '/' if !session[:user_id]
  end
end
