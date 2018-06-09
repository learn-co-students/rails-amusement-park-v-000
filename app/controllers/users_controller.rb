class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def new
		@user = User.new
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id 
			 redirect_to user_path(@user), notice: "Welcome to the theme park!"
		else
			render :new 
		end
	end


	def show
		@message = params[:message] if params[:message]
		@message ||= false
		# @user = User.find_by(id: params[:id])
	end


	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to @user, notice: "User was successfully updated." 
		else
			render :edit 
		end
	end


	private

	def set_user
		@user = User.find(params[:id])
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
