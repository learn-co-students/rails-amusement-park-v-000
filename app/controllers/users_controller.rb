class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
    if !current_user.admin
      if  current_user != @user
        if !logged_in
       redirect_to root_path
     end
    end
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :password, :tickets, :happiness, :nausea, :height)
  end
end
