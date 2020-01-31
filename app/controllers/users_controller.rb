class UsersController < ApplicationController
  before_action :user_must_be_logged_in, only: :show # Defined in ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:signed_up] = "You have successfully signed up!"
      flash[:signed_in] = "You are logged in."
      redirect_to user_path(@user)
      # redirect_to user works, too
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end
end
