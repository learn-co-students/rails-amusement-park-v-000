class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.create(user_params)
    @user.admin = true if params[:user][:admin] == true
    @user.save
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      render :new
    end
  end

  def show
    if current_user && logged_in?
      @user = User.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end

  def signin
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end

end
