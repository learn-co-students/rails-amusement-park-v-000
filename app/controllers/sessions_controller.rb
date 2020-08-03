class SessionsController < ApplicationController
#   skip_before_action :verify_authenticity_token, only: :create

   def new
   end
   
   def welcome
   end
   
   def create
       user = User.find_by_email(params[:email])
     if user && user.authenticate(params[:password])
        session[:user_id] = user.id
   
        @user = User.find_or_create_from_auth_hash(auth_hash)
        session[:user_id] = @user.id
        
       redirect_to "/users/index/", notice: "Logged in!"
     else
       flash.now[:alert] = "Email or password is invalid"
       render "/users/show/"
     end
   end
   
   
   def destroy
      if current_user
        session.delete(:user_id)
        flash[:success] = "Sucessfully logged out!"
      else
         session.delete(:user_id)
         redirect_to '/users/home/', notice: "Logged out!"
      end
   end
   
   protected

   def auth_hash
     request.env['omniauth.auth']
   end
   
end
