class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    if !user_params.empty?
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id

        session[:success] = "User account created successfully!"
        redirect_to user_path(@user.id)
      else
        session[:failure] = "Failure, user account not saved."
        render 'new'
      end
    else
      session[:incomplete] = "Failure, fill out all fields."
      render 'new'
    end
  end

  def show
    if logged_in?
      @user = current_user

      @ride_message = session[:ride_message]
      session[:ride_message] = nil

      @success_message = session[:success]
      session[:success_message] = nil

      @incomplete_message = session[:incomplete]
      session[:incomplete] = nil
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
