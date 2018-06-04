class UsersController < ApplicationController

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to @user
		else
			render "new"
		end
		end
	end

	def edit
	end

	def update

	end

	private

	def set_user
	end

	def user_params
		params.require(:user).permit(
			:name, 
			:password, 
			:height, 
			:nausea, 
			:tickets, 
			:happiness, 
			:admin
			)
	end

end
