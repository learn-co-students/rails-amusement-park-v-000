class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if !user_params.blank?
      @user = User.create(user_params)
      session[:user_id] = @user.id
    
      redirect_to user_path(@user)
    else
      flash[:alert] = "Please fill out all fields"
      redirect_to '/signup'
    end
  end

  def signin
  end

  def show
    @user = User.find(params[:id])
  end



  private
  def user_params
    params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
  end
end
