class SessionsController < ApplicationController

	def new
		@users = User.all
	end

	def create
    
		if params[:name] != nil && params[:name] != ""
	        
			@user = User.find_by(name: params[:name])
			
    		return head(:forbidden) unless @user.authenticate(params[:password])
    		session[:user_id] = @user.id
             
		    redirect_to "/users/#{@user.id}"

		elsif session[:user_id] != [] && session[:user_id] != nil
			redirect_to "/users/#{@user.id}"
		else
			redirect_to '/'
		end

	end

	def destroy
		session.delete :user_id
		redirect_to '/'
	end



end
