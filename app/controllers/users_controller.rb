class UsersController < ApplicationController
    
  def home
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
          redirect_to 'new_user_path'
      end
  end

  def show
      @user = User.find_by(:id => params[:id])
      
      if session[:user_id]
          render :show
      else
          redirect_to root_path
      end
  end

  def signin
      @users = User.all
  end

  def login
      @user = User.find_by(:name => params[:user_name])
      if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
      else
          redirect_to root_path
      end
  end

  def destroy
      session.destroy
      redirect_to root_path
  end

  def update
      @ride = Ride.new(:user_id => current_user.id, :attraction_id => params[:attraction_id])
      msg = @ride.take_ride
      redirect_to user_path(current_user), :alert => msg
  end


  private

  def user_params
      params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end


end
