class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to '/'
    end
  end

  def create
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :height,
      :tickets,
      :happiness,
      :nausea,
      :admin
    )
  end
end

