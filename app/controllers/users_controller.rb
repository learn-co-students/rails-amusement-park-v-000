class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    redirect_to '/' if !@user
  end
    
   

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render :welcome
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :happiness, :nausea, :height, :tickets, :password, :admin)
    end
  
end
