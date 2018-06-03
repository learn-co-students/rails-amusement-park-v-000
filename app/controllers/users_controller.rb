class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    if (user = User.create user_params)
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :height,
      :nausea,
      :tickets,
      :admin,
      :password,
      :happiness
    )
  end
end
