class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  protect_from_forgery with: :exception
 

  def home
  end


  def current_user
    User.find_by(id: session[:user_id])
  end


  def admin
    current_user.admin
  end

  def user_is_authenticated
    !!current_user
  end

  def verified_user
    redirect_to '/' unless user_is_authenticated
  end


end
