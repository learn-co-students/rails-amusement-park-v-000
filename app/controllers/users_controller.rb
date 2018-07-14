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
      render :new
    end
  end


  def show
    @user = User.find(params[:id])
    if current_user
      render :show
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :admin, :tickets, :nausea, :happiness)
  end

end
