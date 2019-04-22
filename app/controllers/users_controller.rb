class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
    # binding.pry
  end

  def create
    # binding.pry
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)

  end

  def show
    # binding.pry
    if @user = User.find_by(params[:id])
      render :show
    else
      redirect_to "/signup"
    end

  end



  private

  def user_params(*args)
    params.require(:user).permit(:name, :password, :nausea, :height, :tickets)
  end



end
