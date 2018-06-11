class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :login_required, except [:new, :create, :home]#any exceptions? 
  before_action :authorize

  def login_required
    if !logged_in?
      redirect_to login_path, :notice => "Please login."
    end
  end

  def logged_in?
    !!current_user
  end 

  def current_user 

      @current_user ||= User.find_by(session: session[:user_id]) if session[:user_id]
      #use find_by not find, bec find raises an exception   and find_by returns nil.  
  end 

  def authorize
    redirect_to '/login' unless current_user
  end 
  # use this as a before_action filter. add flash-notice "something went wrong"

end
