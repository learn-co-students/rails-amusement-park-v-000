class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    # byebug
    @user = User.find_by_id(session[:user_id])
    if !att_params.empty?
      r = Ride.create(user_id: @user.id, attraction_id: att_params[:att_id])
      r.take_ride
    end
    redirect_to root_path if @user.nil?
  end

  def signin
    @user = User.new
  end

  def login
    # byebug
    @user = User.find_by(name: user_params[:name])
    return head(:forbidden) unless @user.authenticate(login_pass[:password])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def login_pass
    params.permit(:password)
  end

  def att_params
    params.permit(:att_id)
  end

end
