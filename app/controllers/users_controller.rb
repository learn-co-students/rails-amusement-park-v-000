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
        redirect_to root_path
      end
  end

  def show
    @user = User.find(params[:id])
  end


  private
  def user_params
     params.require(:user).permit(:name, :password, :password_confirmation, :tickets, :admin, :nausea, :happiness, :height, :mood)
   end
end
