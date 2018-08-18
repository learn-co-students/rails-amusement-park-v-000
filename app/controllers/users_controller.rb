class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
binding.pry
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      
      session[:notice] = "User account created successfully!"
      redirect_to user_path(@user)
    else
      session[:alert] = "Failure, user account not saved."
      render :new
    end
  end

  def show
    if logged_in?
      # @user = User.find_by(name: params[:user][:name])
      @user = User.find(session[:user_id])
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
