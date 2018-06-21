
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
        render '/users/new'
      end
  end

  def show
    if session[:user_id]
    @user = User.find(params[:id])
  else
    redirect_to '/'
  end
  end

  private
    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :password, :tickets, :admin)
    end
end
