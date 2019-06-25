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
    @user = User.find_by(id: params[:id])
    if !current_user.admin
      if current_user != @user
        redirect_to root_path
      end
    end
  end

  def index
    if params[:user_id]
      @rides = User.find(params[:user_id]).includes(:users).rides
    else
      @rides = Ride.all
    end
  end



  private
    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

    def admin_params
      params.require(:user).permit(:name, :password)
    end
end
