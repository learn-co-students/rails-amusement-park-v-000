class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


  def require_logged_in
    redirect_to controller: 'sessions', action: 'new' unless current_user
  end
end
