class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :admin?, :admin_text

  def current_user
    User.find_by_id(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def admin?
    !!current_user.admin
  end

  def admin_text
    if current_user.admin == true
      return "ADMIN"
    else
      return ""
    end
  end

end
