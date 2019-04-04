class SessionsController < ApplicationController

  def new

  end

  def create
   @user = User.find_by(id: params[:user][:name])
   binding.pry
   return redirect_to(controller: 'sessions', action: 'new') unless @user.authenticate(params[:user][:password])
   session[:user_id] = @user.id

   render 'users/show'
 end

   def destroy
     session.delete :user_id

     redirect_to root_path
   end
end
