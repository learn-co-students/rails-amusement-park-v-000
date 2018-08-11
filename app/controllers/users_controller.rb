class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'users/new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @message = params[:message]
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end

  def require_login
    redirect_to root_path unless session.include? :user_id
  end
end
