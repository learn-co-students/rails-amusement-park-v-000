class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    if logged_in?
      User.find(session[:user_id])
    end
  end

  def logged_in?
    session[:user_id].present?
  end

  def welcome
    if current_user
      @user=current_user
    end
  end


end
