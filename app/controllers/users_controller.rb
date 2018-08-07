class UsersController < ApplicationController 
	# before_action :require_login
	# skip_before_action :require_login, only: [:new, :create]

	def new 
		@user = User.new
	end 


	def create 
	    @user = User.new(user_params)
	    if @user.save 
	      session[:user_id] = @user.id 
	      redirect_to @user
	    else 
	      render signin_path
	    end
 	end  


	def show
		if !logged_in?
			redirect_to root_path
		else
			@user = User.find(params[:id])
			if @user.admin
				render :layout => "admin"
			end
		end
	end


 	def edit 
 	end 


	def update
		@user = User.find(params[:id])
		@user.rides.build(:attraction_id => params[:attraction_id])
		redirect_to @user
	end


	def destroy
	end



 	private

	def user_params
		params.require(:user).permit(:name, :password, :height, :tickets, :nausea, :happiness, :admin)
	end

	def require_login
    	return head(:forbidden) unless session.include? :user_id    
  	end


end
