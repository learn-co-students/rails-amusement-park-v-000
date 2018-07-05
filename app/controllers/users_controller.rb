class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
    		log_in(@user)
    		redirect_to user_path(@user)
    	else
    		redirect_to new_user_path
    	end
	end

	def show
		if logged_in? && current_user.id = params[:id]
			@user = current_user
		else
			redirect_to root_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
	end
end
