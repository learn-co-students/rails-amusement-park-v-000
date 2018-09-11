class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :must_log_in, except: [:new, :create, :home]
  helper_method :current_user
  helper_method :logged_in?

  private

    def current_user
      user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    def must_log_in
      redirect_to root_path unless logged_in?
    end

end
