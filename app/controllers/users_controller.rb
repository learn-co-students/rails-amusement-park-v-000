class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    if session[:user_id].blank?
      redirect_to '/'
    else
      @user = User.find(params[:id])
    end
  end

  def delete
  end

  private

  def user_params
  params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
  end
end
