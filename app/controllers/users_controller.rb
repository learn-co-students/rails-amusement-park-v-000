class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       session[:user_id] = @user.id 
      # binding.pry
      redirect_to user_path(@user)
    else
      #  binding.pry
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

end
