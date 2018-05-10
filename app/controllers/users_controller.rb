class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to @user
  end

  def show
    if loggedin
      @user = current_user
    else
      redirect_to '/'
    end
  end

  def signin
  end

  def signedin
    @user = User.find_by(name: params[:user][:name])
    session[:user_id] = @user.id
    redirect_to @user
  end

  def logout
    session.destroy
    redirect_to '/'
  end
  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :height, :tickets, :admin)
  end
end
