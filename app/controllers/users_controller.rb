class UsersController < ApplicationController

	def new
		sign_out
	end

	def create
		user_ = User.create(user_params)
		session['user_id'] = user_.id
		redirect_to user_path(user_)
	end

	def show
		if helpers.logged_in?
			@user = User.find_by(id: params[:id])
		else
			redirect_to root_path
		end
	end

	def signin
		sign_out
		render "signin"
	end

	def edit
		user_ = User.find_by(name: params[:user][:name])
		if user_ && user_.authenticate(params[:user][:password])
			session[:user_id] = user_.id
			redirect_to user_path(user_)
		else
			sign_out
			redirect_to signin_path
		end
	end

	def destroy
		session.delete :user_id
		redirect_to '/'
	end

private
	def user_params
		params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets)
	end
	
	def sign_out
		session.delete(:user_id)
	end

end
