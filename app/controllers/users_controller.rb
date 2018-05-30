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
      redirect_to 'users/new'
    end
  end

  def show
    if logged_in?
      @message = params[:message] if params[:message]
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :name, :height, :nausea, :happiness, :tickets, :admin)
  end

end
