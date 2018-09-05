class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if !!params[:user]
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to new_user_path
      end
    else
      if @user = User.find_by(id: params[:user_name], password: params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to new_user_path
      end
    end
  end

  def show
    if @user = User.find(params[:id])
      if session[:user_id] == @user.id
        #rendering show page
      else
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end

  def login

  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
  end
end
