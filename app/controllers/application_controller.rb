class ApplicationController < ActionController::Base
  helper_method :current_user
  protect_from_forgery with: :exception

  def home
    render '/layouts/application'
  end


  def authentication_required
    redirect_to '/' if !logged_in?
  end 


  def logged_in?
    session[:user_id]
  end


  def current_user
    User.find(session[:user_id])
  end


  helper_method :current_user
end
