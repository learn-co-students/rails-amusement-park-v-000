class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
     if logged_in?
       render :show
     else
       redirect_to root_path
     end
  end

  def home
  end

  def destroy
    raise session.inspect
    #session.delete
  end

  private

  def user_params
    params.require(:user).permit(:name,:password, :happiness, :nausea, :height, :tickets, :admin)
  end
end
