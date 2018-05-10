class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :index_link

  def welcome 
  end 

  def logged_in? 
  	!!current_user 
  end 

  def current_user 
  	@user ||= User.find_by(id: session[:user_id])
  end 

  def is_user_admin?(user)
  	user.admin
  end 
  
end
