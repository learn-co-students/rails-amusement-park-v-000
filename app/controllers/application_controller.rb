class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def home
    render :home
  end

  private

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find_by(id: session[:user_id]) if session[:user_id]
    end

end
