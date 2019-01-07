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
    render :show
    @user = User.find_by(params[:id])
  end

  def destroy
    User.destroy(params[:id])
    session.destroy(:user_id)
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

  def require_login
    redirect_to root_path unless session[:user_id] == params[:id]
  end
end
