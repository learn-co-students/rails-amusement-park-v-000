class UsersController < ApplicationController
  before_action :site_security, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  def show
    @user = current_user
  end

  def update
    @ride = current_user.rides.build(attraction_id: params[:id])
    flash[:notice] = @ride.take_ride
    redirect_to user_path(current_user)
  end

  private

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

    def admin_params
      params_require(:user).permit(:name, :password, :admin)
    end

end
