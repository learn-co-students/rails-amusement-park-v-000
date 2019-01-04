class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      if params[:user][:admin] == "1"
        @user.admin = true
      end
      @user.save
      #binding.pry
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Invalid entry"
      redirect_to new_user_path
    end
  end

  def show
    if User.find(params[:id]) && session[:user_id]
      @user = User.find(params[:id])
      render :show
    else
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

end
