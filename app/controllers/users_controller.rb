class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:alert] = @user.errors.full_messages[0]
      redirect_to new_user_path
    end

  end

  def show
    user = User.find_by_id(params[:id])
    if user.nil?
      flash[:alert] = "Can't find the user"
      redirect_to new_user_path
    else
      @user = user
      render 'show'
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end

    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to root_url
      end
    end

end
