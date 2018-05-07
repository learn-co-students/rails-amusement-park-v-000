class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login

  def current_user
    # The session[:user_id] has been set
    if session[:user_id].present?
      user = User.find_by(:id => session[:user_id])
    end
  end

  def require_login
    unless current_user
      redirect_to root_url
    end
  end
end
