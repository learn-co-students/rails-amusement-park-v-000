class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
  end


  private
    def current_user
      @user = session[:user_id]
    end
end
