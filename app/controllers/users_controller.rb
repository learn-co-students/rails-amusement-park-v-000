require 'pry'
class UsersController < ApplicationController
  def new
    @user = User.new(id: nil)
    render :new
  end

  def show

    if session[:user_id] == nil
      redirect_to root_path
    elsif current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      if @user == nil
        redirect_to root_path
      else
        render :show
      end
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def update
    @user = User.find(params[:id])
    ride = Ride.create(user_id: params[:id], attraction_id:params[:attraction_id])
    flash[:message]= ride.take_ride
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name,:height,:happiness,:nausea,:tickets,:admin, :password)
  end

  def current_user
    User.find(session[:user_id])
  end

end
