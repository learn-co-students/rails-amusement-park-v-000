class UsersController < ApplicationController
  #before_action :require_login

  def new
    @user = User.new
  end

  def signin
    @user = User.new
  end

  def create
    #binding.pry
    if params[:user].keys.count > 2
      #binding.pry
      @user = User.new(user_params)
      @user.save
      set_session
    elsif User.find(params[:user][:name])
      #binding.pry
      @user = User.find(params[:user][:name])
      if @user.authenticate(params[:user][:password])
        #binding.pry
        set_session
      else
        #binding.pry
        redirect_to controller: 'users', action: 'new'
      end
    else
      redirect_to new_user_path
    end
  end

  def find
  end

  def show
    if session[:user_id].nil?
      redirect_to '/'
    else
      #binding.pry
      @user = User.find(params[:id])
      if @user.rides.last != nil
        @ride = @user.rides.last
        #@ride.take_ride
        if @ride.take_ride != true
          @message = @ride.take_ride
        else
          @message = "Thanks for riding the #{@ride.attraction.name}!"
        end
      end
    end
  end


  private

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

  def set_session
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

end
