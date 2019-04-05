class SessionsController < ApplicationController
  skip_before_action :verify_user_is_authenticated, only: [:new,:create]
  
  def new

  end

  def create
   @user = User.find_by(id: params[:user][:name])

   if @user.authenticate(params[:user][:password])
     session[:user_id] = @user.id
     render '/users/show'
   else
     flash[:notice] = "Please enter a valid password or Sign Up to create an account."
     redirect_to(controller: 'sessions', action: 'new')
   end
 end

   def destroy
     session.delete :user_id

     redirect_to root_path
   end
end
