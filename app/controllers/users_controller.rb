class UsersController < ApplicationController
  def show
    if session[:user_id] == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to root_url
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to @user
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password)
  end
end
