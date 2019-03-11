class SessionsController < ApplicationController

	def create
		binding.pry
		@user = User.find(params[:id])
		return head(:forbidden) unless @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect_to user_path(@user)
	end

	    def destroy
        	session.delete :user_id
      		redirect_to '/'
	    end


end