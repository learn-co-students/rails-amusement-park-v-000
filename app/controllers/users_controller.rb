class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  render :new
  end

  def create
    @user = User.new(user_params)
    @user.save
    #byebug
    if @user
      session[:user_id] = @user.id
      if logged_in?
        redirect_to @user
      else
        redirect_to '/'
      end
    else
      redirect_to '/signup'
    end
  end

  def show
    if current_user && logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to '/'
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :password_confirmation, :admin)
  end


end
