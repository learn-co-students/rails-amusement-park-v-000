class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/'
    end
  end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to '/'
    end
  end

  def update
    @user = User.find(session[:user_id])
    @ride = Ride.create(user_id: @user.id, attraction_id: params[:attraction][:id])
    flash[:message] = "#{@ride.take_ride}"
    redirect_to user_path(@ride.user)
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  private
  def users_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
