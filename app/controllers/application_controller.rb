class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?



  private 

  def authorize(user = nil)
    if user.nil?
      not_authorized unless logged_in?
    else
      not_authorized unless user == current_user
    end
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

  def not_authorized
    flash[:alert] = "You are not authorized to view that page."
    redirect_to root_path
  end

end
