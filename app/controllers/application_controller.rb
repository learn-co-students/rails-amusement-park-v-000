class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
<<<<<<< HEAD
  helper_method :current_user, :logged_in?

  private
  def authenticatation_required
    redirect_to root_path unless logged_in?
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
=======
  before_action :verify_user_is_authenticated
  helper_method :current_user

  private
  def verify_user_is_authenticated
    redirect_to '/' unless user_is_authenticated
  end

  def user_is_authenticated
    !!current_user
  end

  def current_user
    User.find_by(id:session[:user_id])
>>>>>>> refs/remotes/origin/master
  end
end
