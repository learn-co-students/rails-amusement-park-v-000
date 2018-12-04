class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?



  private 

  def authorize(user = nil)
    if user.nil?
      not_authorized("Login to view this page!") unless logged_in?
    else
      not_authorized unless user == current_user
    end
  end

  def authorize_admin
    authorize
    not_authorized("You must be an admin to view this page.") unless current_user.admin
  end

  def current_user_is?(user)
    user == current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def not_authorized(msg = "You are not authorized to view that page.")
    flash[:alert] = msg
    redirect_to root_path
  end

end
