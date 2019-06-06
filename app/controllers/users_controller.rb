class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    return redirect_to root_path unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    if !logged_in?
      redirect_to "/"
    end
	end




  private

  def user_params
    params.require(:user).permit(:name, :password, :admin, :happiness, :nausea, :height, :tickets)
  end


end
