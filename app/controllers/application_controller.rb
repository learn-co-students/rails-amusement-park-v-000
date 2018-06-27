class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # skip_before_action :is_logged_in, only: [:new, :create, :index, :home]

  # def home
    
  # end
 
  # def current_user
  #    !!session[:user_id]
  # end
  

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) unless session[:user_id] == nil
  end

  private

  def is_logged_in
     redirect_to root_path  unless current_user
  end

  # def current_user
  #   session[:user] ||= []
  # end
end
