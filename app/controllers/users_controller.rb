class UsersController < ApplicationController
  
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else  
      render :new
    end
  end

  def show
    binding.pry
    if logged_in 
      @user = User.find_by(id: params[:id]) 
    else 
      redirect_to '/'
    end
  end

  def update
    @ride = Ride.new(user_id: params[:user][:user_id], attraction_id: params[:user][:attraction_id])
    @user = User.find_by(id: params[:user][:user_id])
    
    if @ride.valid_rider
      @ride.user_update
      redirect_to user_path(@user.id)
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def logged_in
    !session[:user_id].nil?
  end
end
