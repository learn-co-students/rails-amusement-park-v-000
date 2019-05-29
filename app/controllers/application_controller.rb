class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user
  private

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @user = User.find(session[:user_id])
    #binding.pry
  end
end
