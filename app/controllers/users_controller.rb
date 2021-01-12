class UsersController < ApplicationController 
  before_action :logged_in?, only: [:show]
  
  def index
    @users = User.all 
  end 
  
  def new 
    @user = User.new
  end
  
  def show
    @user = User.find_by_id(params[:id])
    
    if !logged_in? 
      redirect_to root_path
    end
  end
  
  def create 
    @user = User.create(user_params)
    if @user.save 
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      render :new
    end 
  end 
  

  
  private 
  
  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end
end 