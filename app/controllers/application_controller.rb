class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authenticate_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] # only make the db call if there is in fact a sesion at the momemtn
  end

  def logged_in?
    !!current_user
  end

  def authenticate_user
    if !logged_in?
      #redirect_to new_user_path
      redirect_to root_path
    end
  end

end
