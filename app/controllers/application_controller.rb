class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_logged_in
    if !logged_in?
      redirect_to root_path
    end
  end

  def sign_in_incomplete?
    params[:user][:name] == "" || params[:user][:password] == ""
  end

end
