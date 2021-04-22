class UsersController < ApplicationController

  def index
  end

  def new
      @user = User.new
  end
  
  def create
     @user = User.new(user_params)
     if @user.save
       flash[:notice] = "Account created successfully!"
       redirect_to '/users/show/'
     else
       flash.now.alert = "Please try again."
       render '/users/new/'
     end
   end
  
  def update
    end
  

private
   
   def user_params
       params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
