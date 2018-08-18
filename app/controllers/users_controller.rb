class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #  if user_params
    if @user.save
      session[:user_id] = @user.id
      # session[:notice] = "User account created successfully!"
      redirect_to user_path(@user.id)
    else
      # session[:alert] = "Failure, user account not saved."
      render 'new'
    end
  end

  def show
# binding.pry
    if logged_in?
      @user = User.find_by_id(session[:user_id])
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
