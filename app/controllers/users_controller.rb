class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]
  
  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save 
      session[:user_id] = @user.id 
      redirect_to user_path(@user) 

    else
      @user.params(user_params).empty?
      redirect_to "users/new", :notice => "Please fill in the blanks"
    end 
  end

  def show
    @user = User.find_by(id: params[:id])
   
  end 

  def edit
  end

  def update
  end

  private 

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end


