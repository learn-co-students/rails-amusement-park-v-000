class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :current_user
   before_action :redirect_if_not_logged_in
   helper_method :current_user


  def current_user
    @user = (User.find_by_id(session[:user_id]) || User.new)
  end

  def logged_in?
    session[:user_id]
  end

  def redirect_if_not_logged_in
    if !logged_in?
      redirect_to root_path
    end
  end

end
