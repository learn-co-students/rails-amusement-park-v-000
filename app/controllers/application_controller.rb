class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :current_user

  def current_user
    @user = (User.find_by_id(session[:user_id]) || User.new)
  end
end
