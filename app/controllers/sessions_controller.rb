class SessionsController < ApplicationController

	def create
		@user = User.find_by(name: params[:user_name])
		return head(:forbidden) unless @user.authenticate(params[:password])
		session[:user_id] = @user.id
	end
end
