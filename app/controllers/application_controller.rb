class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
  	@user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
  	current_user.id != nil
  end

  def require_logged_in
    #binding.pry
  	return redirect_to root_path unless logged_in?
  end

  # def is_admin?
  #   if current_user
  #     current_user.admin
  #   end
  # end
end
