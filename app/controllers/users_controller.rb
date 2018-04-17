
class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]

	def new
		@user = User.new
	end

	def create
	  @user = User.new(user_params(:name, :password, :nausea, :happiness, :tickets, :height, :admin))
		if @user.save
		  session[:user_id] = @user.id

		  redirect_to user_path(@user)
		else
		  render :new
		end
	end

	def show
		@message = params[:message] if params[:message].present?
		@message ||= false
	end

	def edit
	end

	def update
		if @user.update(user_params(:name, :password, :nausea, :happiness, :tickets, :height, :admin))

			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params(*args)
		params.require(:user).permit(*args)
	end

end