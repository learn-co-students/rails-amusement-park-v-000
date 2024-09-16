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
      render 'users/new'
    end
  end

  def show
    @user = User.find(params[:id])

    if @user == current_user
      render 'users/show'
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
  end
end
