class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :edit]

  def new
    @user = User.new
  end

  def show
  end

  def signin
  end

  def create

    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

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
