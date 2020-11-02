class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :authenticate_user

  def home 
  end 

  private

  def logged_in?
    !!current_user
  end 

  def current_user 
    User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if !logged_in? 
      redirect_to root_path
    end
  end
end
