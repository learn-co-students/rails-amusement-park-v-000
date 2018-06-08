class UsersController < ApplicationController

  before_action :authenticate_user, :except => [:new, :create]

  def new
    if logged_in?
      redirect_to user_path(current_path)
    else
    @user = User.new
  end
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
    if logged_in?
      @user = User.find(params[:id])
      @message = params[:message]
    else
      redirect_to root_path
    end
  end

  def update
  end



private

  def user_params
    params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
  end


end
