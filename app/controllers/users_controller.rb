class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
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



  private
    def user_params
      params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end

end
