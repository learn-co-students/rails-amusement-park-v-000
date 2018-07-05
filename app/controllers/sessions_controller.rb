class SessionsController < ApplicationController

	def new
		if logged_in?
			redirect_to root_path
		else
			@users = User.all
		end
	end

	def create
		@user = User.find_by(name: params[:user_name])
    	return head(:forbidden) unless @user.authenticate(params[:password])
    	log_in(@user)
    	redirect_to user_path(@user)
	end

	def destroy
		session.delete :user_id
		redirect_to root_path
	end

end