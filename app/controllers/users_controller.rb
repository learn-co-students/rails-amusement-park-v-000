class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    if !user_params.empty?
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        session[:notice] = "User account created successfully"
        redirect_to user_path(@user)
      else
        session[:alert] = "User account not saved successfully"
        render :new
      end
    else
      session[:alert] = "Error, fill in all form fields before submitting"
      render :new
    end
  end

  def show
    if logged_in?
      @user = current_user
    else
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height, :admin)
  end
end
