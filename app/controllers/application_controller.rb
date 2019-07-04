class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end

  def logged_in?
    !!session[:user_id]
  end

  def require_login
    if !logged_in?
      redirect_to root_path
    end
  end
end
