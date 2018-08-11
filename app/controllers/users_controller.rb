class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to 'users/new'
    end
  end

  def show
    @user = User.find_by(params[:id])
  end



  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :tickets, :mood, :nausea)
  end

end
