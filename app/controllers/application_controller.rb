class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def admin?
    @user.admin = "true"
  end


  def current_user
    !!session[:name]
  end

end
