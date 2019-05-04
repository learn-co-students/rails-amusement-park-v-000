class UsersController < ApplicationController
  before_action :require_login, only: :show

  def index
    @users = User.all
  end

  def new
    # binding.pry

    @user = User.new
    # binding.pry
  end

  def create
    # binding.pry
    @user = User.create(user_params)
    # binding.pry
    session[:user_id] = @user.id
    # binding.pry
    redirect_to user_path(@user)
    # binding.pry
  end
  #
  # def go_on_ride
  #   # "hi"
  #   # take_ride
  #   binding.pry
  #   ride = Ride.new
  #   redirect_to user_path(session[:user_id])
  # end

  def show
    # binding.pry
    @user = User.find_by_id(params[:id])
    # if require_login
    # if session[:user_id] == @user.id
  # this above conditional works and renders show, but the test
  # expects it to fail and render the root route. why is it failing?
  #
      # render :show
    # else
      # redirect_to "/signup"
      # redirect_to "/"
    @message =  params[:message]
    # end

  end

  def destroy
    session.clear
    redirect_to '/'
  end



  private

  def user_params(*args)
    params.require(:user).permit(:name, :password, :nausea, :height, :tickets)
  end



end
