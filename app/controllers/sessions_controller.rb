class SessionsController < ApplicationController

  def new
    @users = User.all 
  end

  def create
   @user = User.find_by(name: params[:user][:name])
   return redirect_to(controller: 'sessions', action: 'new') unless @user.authenticate(params[:user][:password])
   session[:user_id] = @user.id

   render 'users/show'
 end

   def destroy
     session.delete :user_id

     redirect_to '/'
   end
end
