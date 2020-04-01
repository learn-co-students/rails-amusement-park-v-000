class SessionsController < ApplicationController
	skip_before_action :logged_in?, only: [:signin, :login]

	def signin
	end

	def login
		if @user = User.find_by(name: params[:user_name]).try(:authenticate, params[:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to signin_path, alert: 'Try again'
		end
	end

	def logout
		session.delete(:user_id)
		redirect_to root_path
	end

end