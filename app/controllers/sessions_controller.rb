class SessionsController < ApplicationController

	def new
		@users = User.all
	end

	def create
		@user = User.find_by(id: params[:user][:id])
		@user = @user.try(:authenticate, params[:user][:password])
		redirect_to root_path unless @user
		session[:user_id] = @user.id
		redirect_to user_path(@user)
	end

	def destroy
		session.delete :user_id
		redirect_to root_path
	end
end
