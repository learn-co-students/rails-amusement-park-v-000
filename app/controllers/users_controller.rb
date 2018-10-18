class UsersController < ApplicationController
  before_action :authentication_required
  skip_before_action :authentication_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :password, :height, :happiness, :nausea, :tickets, :admin))
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id) 
    else
      render :new
    end
  end

  def show
    if session[:user_id] == params[:id].to_i
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end


  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

end
