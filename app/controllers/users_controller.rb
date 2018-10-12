class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :password, :height, :happiness, :nausea, :tickets, :admin))
    if @user.save
      redirect_to user_path(@user.id) 
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])

  end


  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

end
