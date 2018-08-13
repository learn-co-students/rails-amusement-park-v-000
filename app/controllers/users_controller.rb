class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.admin = true if params[:admin]
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  def show
    if session[:user_id] == params[:id].to_i
      @user = User.find(session[:user_id])
      @user.admin = true if params[:admin]
      render 'users/show'
    else
      @user = User.new
      redirect_to '/'
    end
  end




  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :tickets, :mood, :nausea, :admin)
  end

end
