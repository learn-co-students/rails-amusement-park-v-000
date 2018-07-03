class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: "users", action: "home"
  end

  def home
    @user = User.find(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
  end

end
