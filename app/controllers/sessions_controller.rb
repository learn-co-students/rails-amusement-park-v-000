class SessionsController < ApplicationController
  
   def new
       @user = User.new
       @users = User.all
   end
   
   
def create
     @user = User.find_by(name: params[:user][:name])
      if session[:user_id] = @user.id
        # binding.pry
      redirect_to user_path(@user)
    else
      redirect_to '/signin'
      end
end

def destroy
    session[:user_id] = nil
    redirect_to root_url
end
end
