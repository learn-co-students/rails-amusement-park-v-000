class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end

  def current_user
    if logged_in?
      User.find_by(id: session[:user_id])
    end
  end

end
