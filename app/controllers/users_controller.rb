class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    # binding.pry
    @user = User.find_by(id: params[:id])
    unless session[:user_id] == @user.id
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

end
