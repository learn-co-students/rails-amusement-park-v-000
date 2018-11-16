class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show

  end

  def new
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      format.html { redirect_to user_path(@user), notice: "Welcome to the theme park!" }
    else
      format.html { render :new }
    end
  end

  def edit
  end
  def update
    if @user = User.update(user_params)
      format.html { redirect_to @user, notice: "User was successfully updated." }
    else
      format.html { render :edit }
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(
      :name, :password, :height, :tickets, :happiness, :nausea, :admin
    )
  end
end
