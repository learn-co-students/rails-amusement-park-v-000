class UsersController < ApplicationController
  
  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save 
      session[:user_id] = @user.id 
      redirect_to user_path(@user) 

    else
      params[:user_params].empty?
      redirect_to "users#new", :notice => "Please fill in the blanks"
    end 
  end

  def show

  end 

  def edit
  end

  def update
  end

  def delete
  end

  private 

  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end


