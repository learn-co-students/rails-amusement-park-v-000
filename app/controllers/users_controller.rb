class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find_by(id: params[:id])
    @message = params[:message] if params[:message]
    @message ||= false 
  end

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

  private
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
	end
end
