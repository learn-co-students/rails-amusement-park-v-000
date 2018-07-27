class UsersController < ApplicationController
  def new
    binding.pry
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    if session[:user_id]
      @user = User.find_by(id: params[:id])
    else
      redirect_to '/'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end
end
