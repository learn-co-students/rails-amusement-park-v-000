class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authentification_required
  	if !logged_in?
  		redirect_to root_path
  	end
  end

  def logged_in?
  	session[:user_id]
  end


  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
