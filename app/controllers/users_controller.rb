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
      redirect_to '/signup'
    end
  end

   def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end



   private
  def user_params
    params.require(:user).permit(:name, :password, :height, :nausea, :happiness, :tickets, :admin)
  end


 end
