class UsersController < ApplicationController
  
  def new 
    @user = User.new
  end

  def create
    
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
    params.require(:user).permit(:name, :password_digest, :nausea, :happiness, :tickets, :height, :admin)
  end
end


