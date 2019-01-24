class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/welcome/home"
    else
      render :new
      flash[:alert] = "Please fill in all fields to come inside."
    end
  end




  private

  def user_params
    params.require(:user).permit(:name, :password, :tickets, :height, :happiness, :nausea, :admin)
  end

end
