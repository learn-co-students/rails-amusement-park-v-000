class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :admin?

  def home
    render :home
  end

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def lo_redirector
    if !logged_in?
      redirect_to root_path
    end
  end

  def admin?
    current_user.admin
  end
end
