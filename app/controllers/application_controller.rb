class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :logged_in?

	private

	def logged_in?
		return redirect_to root_path unless session[:user_id]
	end

end
