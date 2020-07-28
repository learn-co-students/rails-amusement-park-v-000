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
       flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
       render '/users/new/'
     end
   end
  
  def update
    end
  
#  def destroy
#      session.delete(:current_user_id)
#      redirect_to root_path
#  end


private
   
   def user_params
       params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
