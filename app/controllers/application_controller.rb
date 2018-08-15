class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :user_signup, :user_login, :require_login, :admin_user?

  def current_user
    if session[:user_id]
      @user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    current_user != nil
  end


  def require_login
	  unless session.include? :user_id
      redirect_to '/'
      flash[:notice] = "You must login to view that page."
    end
	end

  def admin_user?
     current_user.admin
  end

end
