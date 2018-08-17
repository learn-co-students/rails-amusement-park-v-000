class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @user = User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_log_in
    return redirect_to root_path unless logged_in?
  end

end
