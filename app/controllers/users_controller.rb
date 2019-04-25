class UsersController < ApplicationController

  def index
  end

  def show
    if session[:user_id]
      @user = User.find_by_id(params[:id])
      if !@user.rides.empty?
        @ride = @user.rides.last
        #binding.pry
      end
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :tickets, :nausea, :happiness, :admin)
  end

end
