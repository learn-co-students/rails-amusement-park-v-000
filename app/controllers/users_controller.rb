class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    @user.save

    if @user.save
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
    else
      redirect_to users_new_path
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])

    if @user
      render :show
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

  def require_login
    redirect_to controller: 'sessions', action: 'new' unless logged_in?
  end

end
