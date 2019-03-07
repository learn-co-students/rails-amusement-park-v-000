class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper

  def home
  end

  def verify_admin
  	redirect_to root_path unless current_user && current_user.admin?
  end

end
