class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_user_is_authenticated
  helper_method :current_user 

  private 

  def verify_user_is_authenticated
  	if !current_user 
  		redirect_to '/'
  	end
  end	

  def current_user 
  	@current_user ||= User.find_by(id: session[:user_id])
  end 
  
end
