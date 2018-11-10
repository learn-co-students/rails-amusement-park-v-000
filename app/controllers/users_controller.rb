class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  def create
    @user = User.create(user_params)
    if !@user.save
      redirect_to controller: 'users', action: 'new'
    else
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def update
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        redirect_to controller: 'users', action: 'edit'
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :tickets, :height, :nausea)
  end
end
