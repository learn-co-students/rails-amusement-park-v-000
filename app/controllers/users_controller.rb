class UsersController < ApplicationController

	def new
    @user = User.new
  end

  def create
    binding.pry
    if !params[:user].blank && !params[:password].blank? #if name is not blank
        binding.pry
        @user = User.create(user_params)
        redirect_to root_path
    else
        redirect_to signup_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
