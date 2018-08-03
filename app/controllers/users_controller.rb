class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
     if !!session[:user_id]
      @user = User.find_by_id(params[:id])
      @message = params[:message]
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :tickets, :happiness, :height, :admin)
  end
end
