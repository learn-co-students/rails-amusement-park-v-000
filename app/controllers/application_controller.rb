class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def logged_in?
    !!curent_user
  end

  def curent_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


end
