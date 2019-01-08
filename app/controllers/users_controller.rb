class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signup_path
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def take_ride
    @user = User.find(params[:id])
    
    ride = @user.rides.create(attraction_id: params[:attraction_id]).take_ride
    if ride == true
      flash[:message] = "Thanks for riding the #{Attraction.find(params[:attraction_id]).name}!"
    else
      flash[:message] = ride
    end

    redirect_to user_path(@user)
  end


  private

  def user_params
    params.require(:user).permit(:name,:password, :nausea, :tickets, :happiness, :height, :admin, :attraction_id, attraction_attributes: [:happiness, :nausea, :tickets])
  end

end
