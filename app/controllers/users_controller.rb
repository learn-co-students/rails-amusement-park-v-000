class UsersController < ApplicationController
  #before_action :require_login
#  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    redirect_to '/' unless session.include? :user_id
    @user = User.find_by(id: params[:id])
  end


    def update
      redirect_to user_path(current_user)
    end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end
#  def require_login
#  redirect_to '/' unless session.include? :user_id
#end
end
