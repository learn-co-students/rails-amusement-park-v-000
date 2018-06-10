class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login, except: [:new, :create, :home]
  helper_method :current_user

  private

  def current_user
    # session[:name] has the user_id of the user that signed in
    session[:user_id]
  end

  def require_login
    redirect_to root_path unless current_user
  end
end
