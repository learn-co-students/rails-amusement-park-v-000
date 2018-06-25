class UsersController < ApplicationController
before_action :set_user, only: [:show]
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render 'users/new'
		end
	end

	def show
		@message = params[:message] if params[:message]
		@message ||= false
		if !logged_in?
			redirect_to root_path
		end
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin )
	end

end