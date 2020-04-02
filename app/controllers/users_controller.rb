class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
      @user = User.find(params[:id])
      if !current_user.admin
        if current_user != @user
          redirect_to root_path
        end
      end
  end

  def index
    if current_user.admin
      @users = User.all
    else
      redirect_to user_path(current_user)
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :height, :nausea, :happiness, :tickets, :password, :admin)
    end

end
