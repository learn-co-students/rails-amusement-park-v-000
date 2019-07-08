class UsersController < ApplicationController
  def show
    require_logged_in
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
		@user = User.create(user_params)
		return redirect_to root_path unless @user.save
		session[:user_id] = @user.id
		redirect_to user_path(@user)
	end

  private

	def user_params
		params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
	end
end
