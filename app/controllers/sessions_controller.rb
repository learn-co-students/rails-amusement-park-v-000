class SessionsController < ApplicationController 
	def signin
		@users = User.all
		render "users/signin"
	end


	def confirm_signin 
		
		@user = User.find(params["user_name"]) 
		@password = params["password"] 
		
		if @user.password != @password
			redirect_to "/signin", alert: "Username or password incorrect" 
		else
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		end 
	end

	def signout 
		session.delete :user_id
		redirect_to root_url_path
	end 
end 
