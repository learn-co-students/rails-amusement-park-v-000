class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def require_login
    redirect_to root_path unless helpers.logged_in?
  end

  def require_user_authentication
    redirect_to root_path unless helpers.current_user == params[:id].to_i
  end
end
