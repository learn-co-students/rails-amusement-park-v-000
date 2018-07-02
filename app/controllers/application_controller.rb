class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) unless session[:user_id] == nil
  end

  private

  def is_logged_in
     redirect_to root_path  unless current_user
  end

end
