class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    session[:user_id]
  end

  private
    def require_login
      redirect_to root_path unless session.include? :user_id
    end
end
