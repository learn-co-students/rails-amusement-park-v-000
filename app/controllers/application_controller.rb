class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def logged_in?
    !!session[:user_id]
  end

  # def current_user
  #   user ||= if User.find_or_create_by() session[:user_id]
  #   user = (User.find_by(id: session[:user_id]) || User.new)
  # end
end
