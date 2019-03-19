class UsersController < ApplicationController

  def new
    @user = User.new 
  end
  
  def create
    @user = User.create(user_params)
    return redirect_to '/users/new' unless @user.save
    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}"
  end
  
  def show
    # binding.pry
    @user = User.find_by(id: params[:id])
  end

  private 

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height)
  end
end
