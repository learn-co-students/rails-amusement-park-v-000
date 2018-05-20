class UsersController < ApplicationController
  #before_action :require_logged_in
  #skip_before_action :require_logged_in, only: [:new, :create]
  helper_method :take_ride
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    #byebug
    if !session.include? :user_id
      redirect_to root_path
    else
      @user = User.find(params[:id])

      render :show
    end
  end

  def update
    @user = User.find(params[:id])
    #byebug
    redirect_to user_path(@user)
  end

  private

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

end
