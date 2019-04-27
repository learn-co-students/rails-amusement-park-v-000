class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    session[:user_id]
  end

  private

  def require_login
    if (!current_user)
      redirect_to root_path
    end
  end
end
