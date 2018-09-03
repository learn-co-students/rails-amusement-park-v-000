class UsersController < ApplicationController

  # before_action :authenticate_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
    if (session[:user_id]==params[:id].to_i)
      @user=User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  def update
    @ride = Ride.find_by_id(params[:id])
    flash[:message] = "#{@ride.take_ride}"
    @user = @ride.user
      if @user.save
        redirect_to @user
      else
        render "/attractions"
      end 
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets)
  end

end
