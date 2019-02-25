class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Sign Up Failed! Please Try Again."
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    require_logged_in
    @user = current_user
  end

   private

   def user_params
    params.require(:user).permit(
      :name,
      :height,
      :happiness,
      :nausea,
      :tickets,
      :password,
      :admin
    )
   end

end
