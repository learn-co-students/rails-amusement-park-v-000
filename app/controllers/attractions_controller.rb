class UsersController < ApplicationController
  before_action :athenticate_user, only:[:show]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to new_user_path
    end
  end

  def show
    # @user = User.find_by(id: params[:id])
    # if !current_user.admin
    #   if current_user != @user
    #     redirect_to root_path
    #   end
    # end

    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end

end
