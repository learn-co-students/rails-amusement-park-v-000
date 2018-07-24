class UsersController < ApplicationController

  def new
    @user = User.new

    render 'signup'
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

  def show
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets)
    end
end
