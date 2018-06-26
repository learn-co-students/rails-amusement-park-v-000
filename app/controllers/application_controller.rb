class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def logged_in?
    !!current_user
  end

  def authentication_required
    if !logged_in?
      redirect_to root_path
    end
  end
  # couldve done like
  #
  # def authentication_required
  #   redirect_to root_path unless logged_in?
  # end

end
