class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_user_authenticated
  skip_before_action :verify_user_authenticated, only:[:home]
  helper_method :current_user

  def home
  end


  def current_user
    User.find_by(id: session[:user_id])
  end

  def user_authenticated
    !!current_user
  end

  def verify_user_authenticated
    redirect_to '/' unless user_authenticated
  end

end
