class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    # The Login Required lesson should help refactor the authorization/require_logged_in part.
    # The Login Required Lab has #current_user, as does the Authentication: Video Review.
    if logged_in?
      @user = User.find_by_id(params[:id])
    else
      flash.alert = "You must be logged in to view this page."
      redirect_to root_path
    end
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
