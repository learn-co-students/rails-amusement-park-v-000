class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.admin = params[:user][:admin]
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    redirect_to '/' if !logged_in?
  end

  def signin
    @user = User.find_by(name: params["user_name"])
    if @user
      session[:user_id] = @user.id if  @user.authenticate(params["password"])
      if session[:user_id]
        redirect_to user_path(@user)
      else
        redirect_to signin_path
      end
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :nausea, :tickets, :happiness, :admin)
  end

end
