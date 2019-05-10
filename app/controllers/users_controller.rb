class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def signin
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets)
    end

end
