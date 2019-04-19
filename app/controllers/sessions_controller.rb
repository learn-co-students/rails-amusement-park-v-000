class SessionsController < ApplicationController

	def new
		@users = User.all
	end

	def create
		@user = User.find_by(id: params[:user][:id])
# binding.pry
		@user = @user.try(:authenticate, params[:user][:password])
		return redirect_to root_path unless @user 
		session[:user_id] = @user.id 
		# if logged_in? && current_user == @user
			redirect_to user_path(@user)
		# else
			# redirect_to root_path
		# end
	end

	def destroy
		session.delete :user_id
		redirect_to '/'
	end

end