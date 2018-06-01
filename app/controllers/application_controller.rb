class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :login_required, except [:new, :create, :home]#any exceptions? 
  helper_method :logged_in? 

  def login_required
    if !logged_in?
      redirect_to login_path, :notice => "Please login."
    end
  end

  def logged_in?
    !!current_user
  end 

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user.id])
    end
  end 
end
