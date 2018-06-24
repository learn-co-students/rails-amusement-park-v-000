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
     redirect_to new_user_path
   end
 end

 def show
   if logged_in?
     @user = set_user
     render :show
    else
      redirect_to '/'
    end
 end

 def edit
   @user = set_user
 end


 def update
   @user = set_user
    @user.update(user_params)
     redirect_to user_path(@user)
 end


private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :height, :tickets, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
