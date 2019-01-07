class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      puts @user.id
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    puts @user.id
  end

  def destroy
    User.destroy(params[:id])
    session.destroy(:user_id)
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea,
    :happiness, :tickets, :height, :admin)
  end

  def require_login
    redirect_to root_path unless helpers.current_user == params[:id].to_i
  end
end
