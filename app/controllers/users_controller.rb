class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
     @user = User.create(user_params)
     if @user.save
       if params[:user][:admin] == "1"
         @user.admin = true
       end
       session[:user_id] = @user.id
       redirect_to user_path(@user)
     else
       redirect_to "/"
     end
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      render :show
    else
      redirect_to "/"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
  end

end
