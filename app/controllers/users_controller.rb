class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    return redirect_to '/signin' unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end

end
