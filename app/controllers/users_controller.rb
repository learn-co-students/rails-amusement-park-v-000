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
    if session[:user_id].present?    
      @user = User.find_by(id: params[:id])
    else
      redirect_to '/'
    end
  end

  private 

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
  end


end
