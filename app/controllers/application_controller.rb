class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    current_user.id !=nil
  end

  def require_logged_in #help make things dry
    redirect_to root_path unless logged_in?
  end
end
