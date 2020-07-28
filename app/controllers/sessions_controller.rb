class SessionsController < ApplicationController
    
   def new
   end
   
   def welcome
   end

   def create
     user = User.find_by_email(params[:email])
     if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       redirect_to root_url, notice: "Logged in!"
     else
       flash.now[:alert] = "Email or password is invalid"
       render "/users/show/"
     end
   end
   
   
   def destroy
     session.delete(:user_id)
     redirect_to '/users/home/', notice: "Logged out!"
   end
   
   
end
