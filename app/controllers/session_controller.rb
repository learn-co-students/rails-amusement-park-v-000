class SessionController < ApplicationController
	skip_before_action :verify_user_is_authenticated, only: [:new, :create]

	def new
		@user= User.new
	end 

	def create
		@user = User.find_by(name: params[:user][:name])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else 
			render 'new'
		end		
	end

	def destroy
		session.delete("user_id")
		redirect_to root_path
	end	 

  
end