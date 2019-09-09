class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin?
    current_user.admin
  end


  def current_user
    @current_user ||= User.find(session[:user_id])
  end

end
