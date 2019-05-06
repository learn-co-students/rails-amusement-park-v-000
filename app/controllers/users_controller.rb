class UsersController < ApplicationController
  def new
    @user = User.new
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

 def show
   if logged_in?
     set_user
     @message = params[:message] if params[:message]
     message ||= false
   else
     redirect_to root_path
   end
 end

 private
 def logged_in?
   session[:user_id]
 end

 def set_user
   @user = User.find(params[:id])
 end

 def user_params
   params.require(:user).permit(:name, :height, :tickets, :happiness, :nausea, :admin, :password)
 end


end
