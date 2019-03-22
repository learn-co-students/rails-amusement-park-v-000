class UsersController < ApplicationController

  def new
    @user = User.new 
  end
  
  def create
    if session[:user_id]
      @user = User.find(session[:user_id])
    end

    @user = User.create(user_params)
    return redirect_to '/users/new' unless @user.save
    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}"
  end

  def show
    @message = params[:message] if params[:message]
    @message ||= false
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
