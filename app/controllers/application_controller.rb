class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_user
  helper_method :current_user, :user_authenticated, :admin
  
  # ------------------------------PRIVATE METHODS BELOW ---------------------------------
  private
  
  def verify_user
    redirect_to '/' unless user_authenticated
  end
  
  def user_authenticated
    !!session[:user_id]
  end
  
  def admin
    current_user.admin
  end 
  
  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end 
  
end
