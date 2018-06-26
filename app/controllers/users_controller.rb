class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
      @message = params[:message] if params[:message]
      @message ||= false
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
  end

  private
    def set_user
      @user = User.find_by(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

end
