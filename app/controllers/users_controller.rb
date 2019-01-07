class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.messages
      render :new
    end
  end

  def show
    if session[:user_id] == params[:id]
      @user = User.find_by(params[:id])
      render :show
    else
      redirect_to root_path
    end
  end

  def destroy
    if session[:user_id] == params[:id]
      User.destroy(params[:id])
      session.destroy(:user_id)
    end
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea,
    :happiness, :tickets, :height, :admin)
  end
end
