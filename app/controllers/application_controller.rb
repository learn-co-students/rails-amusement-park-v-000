class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def login(user)
  	session[:user_id] = user.id 
  end

  def logged_in?
  	!!current_user
  end

  def current_user
  	@current_user ||= User.find_by(:id => session[:user_id])
  end

  def authentication_required
    if !logged_in?
      flash[:message] = "Must be logged in to do anything"
      redirect_to root_path
    end
  end
  
  helper_method :current_user
end
