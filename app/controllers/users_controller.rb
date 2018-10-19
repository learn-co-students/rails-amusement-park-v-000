class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    redirect_to user_path(user.id)
  end

  def index
  end


private

def user_params
  params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :password_confirmation)
end

end
