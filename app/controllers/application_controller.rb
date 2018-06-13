class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :require_login

  # def cart
  #   session[:cart] ||= []
  # end



  private
  def current_user
    session[:user_id]
  end
  def require_login
    redirect_to root_url  unless current_user
  end

end
