class UsersController < ApplicationController 
	def index
		if !session[:user_id].nil?
			@user = User.find(session[:user_id])
		else
			@users = User.all.length
		end
	end

	def new 
	#user sign in goes here.
		@user = User.new
	end 

	def create 
		if User.create!(user_params) 
			session[:user_id] = User.last.id
			redirect_to user_path(User.last) 
		else 
			redirect_to new_user, alert: "Submission Failed. Please try again."
		end 
	end

	

	def show 
		if session[:user_id].nil?  
			redirect_to root_url_path
		else
			@user = User.find(params[:id]) 
		end 
	end 

	def user_params 
		params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin) 
	end 
end 
