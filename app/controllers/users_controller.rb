class UsersController < ApplicationController

  def new
  end

  def create
    @user=User.create(user_params)
    session[:user_id]=@user.id

    redirect_to user_path(@user)
  end

  def show
    if logged_in?
      @user=User.find_by(id:       session[:user_id])
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

end
