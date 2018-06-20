class UsersController < ApplicationController 


  def index 
    @users = User.all

  end

  def new 
    @user = User.new
    @users = User.all
  end

  def show 
    @user = User.find(params[:id])
    @result = params[:result] if params[:result]

  end

  def create 
    @user = User.new(user_params)
    if  @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      redirect_to new_users_path
  end
    
end




  private 

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)

  end

end