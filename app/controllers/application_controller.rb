class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    # returns @current user or sets @ current user to the user that corresponds to the session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # def admin?
  #   !!current_user.admin?
  # end

  # def logged_in?
  #   !!session[:user_id]
  # end

end
