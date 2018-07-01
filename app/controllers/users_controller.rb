class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    @user = User.find_by(id: params[:id])
    # @message = params[:message] if params[:message]
  end

  def destroy
    session.delete(:user_id)
  	redirect_to root
  end

  private

  def logged_in?
    redirect_to '/' unless current_user
  end

  def user_params
    params.require(:user).permit(:name, :password, :height, :tickets, :happiness, :nausea, :admin)
  end

end
