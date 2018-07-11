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
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user && @user.id == session[:user_id]
      render :show 
    else 
      redirect_to root_path 
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets, :admin)
  end


end
