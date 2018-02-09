class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verify_user_is_authenticated

  private
  def verify_user_is_authenticated
    redirect_to '/' unless User.find_by(id:session[:user_id])
  end
end
