class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_action :current_user
  before_action :require_login, except: [:new, :create, :home]
	
	def logged_in?
	  !!current_user
	end

	# def is_admin
	# 	unless current_user.admin
	# 	  redirect_to attractions_path
	# 	end
	# end

	private

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section."

        redirect_to root_path
      end
  	end

  	def is_admin
		current_user.admin
	end

  	helper_method :current_user, :is_admin
end
