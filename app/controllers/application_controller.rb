class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    session[:user_id].try {|user_id| User.find_by(id: user_id)}
  end
end
