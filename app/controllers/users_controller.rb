class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
    # binding.pry
    if !logged_in?
      redirect_to root_path
    end
    if @user.admin
      render :layout => "admin"
    end
  end

  def edit

  end

  def update
    @user = User.find(params[:id])
    @user.rides.build(:attraction_id => params[:attraction_id])
    flash[:message] = @user.rides.last.take_ride
    redirect_to @user
    # binding.pry
  end

  def index

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:name, :nausea, :height, :tickets, :happiness, :password, :admin)
  end
end
