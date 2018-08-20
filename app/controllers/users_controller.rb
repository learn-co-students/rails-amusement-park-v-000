class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.create(user_params)

      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to user_new_path
    end
  end

  def show
    if current_user
      @user = current_user
      
      params[:message] ? @message = params[:message] : nil
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end
end
