class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  render :new
  end

  def create
    @user = User.new(user_params)
    #byebug
    @user.save
    #byebug
    #if @user
      session[:user_id] = @user.id

    #byebug
      #session[:user_id] = @user.id
    redirect_to @user
    #else
      #render :new
    #end
  end

  def show
    @user = User.find_by(id: params[:id])
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
