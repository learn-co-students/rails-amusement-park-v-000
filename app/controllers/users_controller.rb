class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render :new		
		end
		
	end

	def show
		if !logged_in?
			redirect_to 'signin'
		end
		@user = current_user
	end

	def update
		# check for attraction_id, if so we are going on a ride
		if !params[:user][:attraction_id].nil?
			attraction = Attraction.find(params[:user][:attraction_id])
			ride = Ride.new(:user => current_user, :attraction => attraction)
			flash[:message] = ride.take_ride
			redirect_to user_path(current_user)
		else
			# just updating user info
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :height, 
			:happiness, :nausea, :tickets, :password, 
			:admin)
	end
end