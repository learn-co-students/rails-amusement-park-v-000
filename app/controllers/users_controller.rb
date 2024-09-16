class UsersController < ApplicationController
  before_action :require_logged_in, only: :show 
  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
		@user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
  		redirect_to user_path(@user)
	  else
      redirect_to root_path
    end
	end

  private

	def user_params
		params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
	end
end
