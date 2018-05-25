class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index, :new, :create]

  def index
    #code
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @message = params[:message]
  end

  def edit
    #code
  end

  def update
    #code
  end

  def destroy
    #code
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :name, :nausea, :happiness, :tickets, :height, :admin)
  end
end
