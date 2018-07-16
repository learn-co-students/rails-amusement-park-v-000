class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    return render :new unless user.save

    session[:user_id] = user.id
    redirect_to user_path(current_user)
  end

  def show
    @user = User.find(params[:id])
    current_user ? (render :show) : (redirect_to root_path)
  end

private

  def user_params
    params.require(:user).permit(
      :name, 
      :password, 
      :height, 
      :admin, 
      :tickets, 
      :nausea, 
      :happiness
    )
  end
  
end