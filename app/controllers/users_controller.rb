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
      #redirect_to signup_path #if pass & pass confirmation dont match, redirect to New User Path
    end
  end

  def show #only show if logged_in use a logged_in helper method
  #  binding.pry
    # if !logged_in?
    #   redirect_to new_user_path
    # else
      @user = User.find_by(id: params[:id])
      if !current_user.admin #if you are NOT the admin
        if current_user != @user #AND if you are NOT the current_user, redirecto to home page
        redirect_to root_path
      #redirect_to user_path(@user)
    end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

end
