class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user

  def hello
  end


private 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:id]
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
    if !logged_in?
      redirect_to '/'
    end
  end


 
end
