class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  # def cart
  #   session[:cart] ||= []
  # end

  def current_user
    session[:user_id]
  end

  private

  def require_login
    redirect_to '/'  unless current_user
  end

end
