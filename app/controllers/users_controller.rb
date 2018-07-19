class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @user = set_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def signin
    @users = User.all
  end

  def show
    if !logged_in?
        redirect_to root_path
    elsif logged_in? && params[:attraction]
      can_you_ride?(params)
    else
      current_user
    end
  end


  def login
    @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'signin'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end


  private



    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end


end
