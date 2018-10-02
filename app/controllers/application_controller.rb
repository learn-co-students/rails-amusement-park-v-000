class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :login!, :logged_in?, :current_user, :authorized_user?


  def login!
    session[:user_id] = @user.id
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authorized_user?
     @user == current_user || current_user.admin == true
   end

end
