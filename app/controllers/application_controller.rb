class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user, :admin 

  private

  def logged_in?
    !!current_user 
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] 
  end

  def authenticate_user
    if !logged_in?
      redirect_to root_path
  end
end

  def admin
    unless current_user.admin
      flash[:notice] = "You must be an admin to perform that function!"
      redirect_to user_path(current_user)
    end
  end
end 


