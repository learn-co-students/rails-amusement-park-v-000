class UsersController < ApplicationController

  def index
  end


  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        render 'index'
      end
  end

  def show
    @user = User.find_by(params[:id])
  end


  private
  def user_params
     params.require(:user).permit(:name, :password, :password_confirmation, :tickets, :admin, :nausea, :happiness, :height, :mood)
   end
end
